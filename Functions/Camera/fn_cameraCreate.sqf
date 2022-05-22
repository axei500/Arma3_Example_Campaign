/*
	Author: Axel Huybrechts

	Description:
		Creates a camera for further use

	Parameter(s):
		0: Type of camera(String) - (Opt, default = camera) https://community.bistudio.com/wiki/camCreate
		1: EffectName(String) - (Opr, default = internal) https://community.bistudio.com/wiki/cameraEffect
		2: EffectPosition(String) - (Opt, default = back) https://community.bistudio.com/wiki/cameraEffect

	Returns:
		Camera object 

	Example:
		["camera","internal","back"] call BIS_fnc_createCamera
*/

params [
["_type", "camera", [""]],
["_effectName", "internal", [""]],
["_effectPosition", "back", [""]]
];

// Sets speed to 1 times
setAccTime 1;

_camera = _type camCreate [0,0,0];

_camera cameraeffect [_effectName, _effectPosition];

// If you don't wait here the soldier wil keep running in the starting position
//sleep 1;

_camera;