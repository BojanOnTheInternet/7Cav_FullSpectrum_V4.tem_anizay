private _state = param [0, "", [""]];

if (_state == "init") then
{

	[] call MAP_InitializeGeneral;
	[] call HUD_Pilot_Initialize;

	player setVariable ["SPM_BranchOfService", "air"];

	[player] call CLIENT_SetInfantryVehiclePermissions;
	
	{
		player setVariable [_x, [[TypeFilter_BaseServiceVehicles, [], {}]] + (player getVariable _x)];
	} forEach ["VP_Driver"];

	// Override the infantry turret permissions so we can enable the copilot as appropriate
	_permissions = [];
	_permissions pushBack [TypeFilter_InfantryVehicles, [], {}];
    _permissions pushBack [TypeFilter_Copilot, [], { if (player in [(_this select 0) turretUnit [0]]) then { (_this select 0) enableCopilot true } }];
	_permissions pushBack [TypeFilter_All, [VPC_UnlessTurretArmed, VPC_UnlessLogisticsDriving], {}];
	player setVariable ["VP_Turret", _permissions];
};

if (_state == "respawn") then
{

};