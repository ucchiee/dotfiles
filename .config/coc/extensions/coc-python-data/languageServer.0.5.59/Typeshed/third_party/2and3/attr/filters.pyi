from typing import Union
from . import Attribute, _FilterType

def include(*what: Union[type, Attribute]) -> _FilterType: ...
def exclude(*what: Union[type, Attribute]) -> _FilterType: ...