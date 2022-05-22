/*
	Author: Axel Huybrechts

	Description:
		Makes a camera follow a object

	Parameter(s):
		0: Camera(Object) - the camera you will use, to create a camera use call BIS_fnc_createCamera
		1: ObjectToFollow(Object) - The vehicle or unit you want to follow with the camera
		2: RelitavePosition(Position) - Position relative to the object you want to follow [x,y,z]
		3: TimeBeforeCameraMoves(Number) - the time in seconds before the camera move, default is 0

	Returns:
		Nothing

	Example:
		[_camera,OffroadOne,[0,-13,1.2]] call Camera_fnc_cameraFollow;
*/

params [
["_camera", objNull, [objNull]],
["_objectToFollow", objNull, [objNull]],
["_relitavePosition", [0,0,0], [[], objNull, 0],[3]],
["_timeBeforeCameraMoves",0,[0]]
];

//https://community.bistudio.com/wiki/camSetTarget
_camera camSetTarget _objectToFollow;
// https://community.bistudio.com/wiki/camSetRelPos
_camera camSetRelPos _relitavePosition;
// https://community.bistudio.com/wiki/camCommit
_camera camCommit _timeBeforeCameraMoves;