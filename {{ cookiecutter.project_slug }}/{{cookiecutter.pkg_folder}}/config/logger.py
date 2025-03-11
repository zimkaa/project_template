import logging.config
from pathlib import Path
from typing import Final

import yaml

from .settings import settings

CURRENT_FOLDER = Path(__file__).parent
LOGGER_CONFIG_FOLDER_NAME: Final[str] = "logging_config.yaml"

logger = logging.getLogger(settings.NAME)


def setup_logging(config_file: str = LOGGER_CONFIG_FOLDER_NAME) -> None:
    with Path(CURRENT_FOLDER / config_file).open() as f_in:
        config = yaml.safe_load(f_in)

    logging.config.dictConfig(config)


logger_level = settings.LOGGER_LEVEL
logger.setLevel(logger_level)
setup_logging()
