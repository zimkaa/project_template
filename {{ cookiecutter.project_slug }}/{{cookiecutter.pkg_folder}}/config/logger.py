"""Модуль инициализации логгера"""

import logging.config
import sys
import threading
from types import TracebackType

from .settings import settings


LOG_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "log": {"format": "%(asctime)s [%(levelname)-8s] %(message)s"},
        "msr": {"format": "%(thread)d %(asctime)s %(message)s"},
        "loki": {
            "format": "%(asctime)s %(funcName)s %(levelname)s %(message)s",
            "class": "pythonjsonlogger.jsonlogger.JsonFormatter",
        },
    },
    "handlers": {
        "default_handler": {
            "level": settings.LOG_LEVEL,
            "class": "logging.StreamHandler",
            "stream": "ext://sys.stdout",
            "formatter": "loki",
        },
    },
    "loggers": {
        "{{cookiecutter.project_name}}": {
            "handlers": ["default_handler"],
            "level": settings.LOG_LEVEL,
            "propagate": False,
        },
    },
}

logging.config.dictConfig(LOG_CONFIG)
service_logger = logging.getLogger("{{cookiecutter.project_name}}")


def except_logging(
    exc_type: type[BaseException],
    exc_value: BaseException,
    exc_traceback: TracebackType | None,
) -> None:
    """Обработчк эксепшна логировани"""
    service_logger.error("Uncaught exception", exc_info=(exc_type, exc_value, exc_traceback))


def unraisable_logging(args: "sys.UnraisableHookArgs") -> None:
    """Еще один обработчк эксепшна логировани"""
    default_msg = "Unraisable exception"

    service_logger.error(args.err_msg or default_msg, exc_info=args.exc_value)
    raise args.exc_type


def threading_except_logging(args: tuple) -> None:
    """Обработчк эксепшна потоков"""
    exc_type, exc_value, exc_traceback, _ = args
    service_logger.error("Uncaught threading exception", exc_info=(exc_type, exc_value, exc_traceback))


def monkey_patch_exception_hooks() -> None:
    """Патчинг эксепшнов"""
    sys.excepthook = except_logging
    sys.unraisablehook = unraisable_logging
    threading.excepthook = threading_except_logging
