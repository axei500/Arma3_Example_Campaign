/*
	Author: Axel Huybrechts

	Description:
		Checks if a group of soldiers is in a vehicle. 

	Parameter(s):
		0: Group - (Required) the group that needs to get in a vehicle.
		1: Vehicle - (Required) The vehicle the group needs to get in.

	Returns:
		BOOLEAN - To signafy end of function

	Example:
		[PassengerGroup,OffroadOne] call BIS_fnc_groupInVehilce
*/

params [
["_group", objNull, [grpNull]],
["_vehicle", objNull, [objNull]]
];

_inVechile = [];
_units = units _group;

{ _inVechile append [false];} ForEach _units;

 {
  if (_x in _vehicle) then 
   {
    _index = _units find _x;
    _inVechile set [_index, true];
   };
 } ForEach _units;

_allIn = false;
if (_inVechile find false != -1) then
{
	_allIn = false;
} else {
	_allIn = true;
};

_allIn;