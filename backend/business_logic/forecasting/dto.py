from dataclasses import dataclass
from datetime import datetime
from enum import Enum

class ActionType(Enum):
    TURN_ON = "TURN_ON"
    TURN_OFF = "TURN_OFF"
    SET_TEMPERATURE = "SET_TEMPERATURE"

@dataclass
class HistoricalDataDTO:
    timestamp: datetime
    value: float
    sensor_type: str

@dataclass
class ForecastDTO:
    target_timestamp: datetime
    predicted_value: float

@dataclass
class DeviceCommandDTO:
    device_id: int
    action: ActionType
    value: float
