/*
	Author: Axel Huybrechts

	Description:
		Creates a camera for further use

	Parameter(s):
		0: Camera - the camera you want to destroy
		1: EffectName(String) - (Opr, default = internal) https://community.bistudio.com/wiki/cameraEffect
		2: EffectPosition(String) - (Opt, default = back) https://community.bistudio.com/wiki/cameraEffect

	Returns:
		Nothing

	Example:
		["camera","internal","back"] call BIS_fnc_cameraDestroy
*/

params [
["_camera", objNull, [objNull]],
["_effectName", "terminate", [""]],
["_effectPosition", "back", [""]]
];

// Sets speed to 1 times
setAccTime 1;

_camera cameraeffect [_effectName, _effectPosition];
camdestroy _camera;