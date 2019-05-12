private _vehicle = param [0, objNull, [objNull]];

(typeOf _vehicle) isKindOf "LandVehicle" && { count (crew _vehicle) == 0 } && { (locked _vehicle) < 2 } && { (vectorUp _vehicle) select 2 < 0.5 }
