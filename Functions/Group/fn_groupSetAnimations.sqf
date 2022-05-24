/*
	Author: Axel Huybrechts

	Description:
		sets sodier animtions based on params, best used on init if you want them to start in a certain location

	Parameter(s):
		0: Group - the convoy group
		1: Animations(String array) - The animations you want to show, use string array with same amount as soldier count. From the way i can see it, the first unit ti recive an animation is the leader, the next one would be the one under de leader in the eden editor(i think).

	Returns:
		returns true to signafy end

	Example:
		[convoy_group,10,10,true] call BIS_fnc_groupSetAnimations
*/

params [
["_group", grpNull, [grpNull]],
["_animations", [""], [[""]]]
];

_soldiers = units _group; 
 
{ 
 _animation = _animations select _forEachIndex;
 [_x, _animation, "ASIS"] call BIS_fnc_ambientAnim; 
} ForEach _soldiers;

true;