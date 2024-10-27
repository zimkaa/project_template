from pydantic import Field
from pydantic_settings import BaseSettings
from pydantic_settings import SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_prefix="APP_", extra="allow", env_file=".env", env_file_encoding="utf-8")

    LOG_LEVEL: str = Field(default="INFO")


settings = Settings()
