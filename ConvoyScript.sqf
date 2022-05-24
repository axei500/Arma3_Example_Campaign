// Importatn for this script you have to set up one group of vehicles, in a file or colum formation
// got a convoy of 4 vehicles last one isnt following for some reason, this can be buggy if a vehicle inst moving at the beginnign try another vehicle

waitUntil { private _scriptCompleted = [passenger_group_front,convoy_vehicle_front] Call Group_fnc_groupGetInVehicle; !isNil "_scriptCompleted" && { _scriptCompleted } };
waitUntil { private _scriptCompleted = [passenger_group_center_one,convoy_vehicle_center_one] Call Group_fnc_groupGetInVehicle; !isNil "_scriptCompleted" && { _scriptCompleted } };
waitUntil { private _scriptCompleted = [passenger_group_center_two,convoy_vehicle_center_two] Call Group_fnc_groupGetInVehicle; !isNil "_scriptCompleted" && { _scriptCompleted } };
waitUntil { private _scriptCompleted = [passenger_group_rear,convoy_vehicle_rear] Call Group_fnc_groupGetInVehicle; !isNil "_scriptCompleted" && { _scriptCompleted } };

{_x call BIS_fnc_ambientAnim__terminate} ForEach units passenger_group_front;
{_x call BIS_fnc_ambientAnim__terminate} ForEach units passenger_group_center_one;
{_x call BIS_fnc_ambientAnim__terminate} ForEach units passenger_group_center_two;
{_x call BIS_fnc_ambientAnim__terminate} ForEach units passenger_group_rear;

// You can combine these 4 in to one big waitUntil, i didn't do it for readebiltiy
waitUntil { private _allIn = [passenger_group_front,convoy_vehicle_front] Call Group_fnc_groupInVehicle; !isNil "_allIn" && { _allIn } };
waitUntil { private _allIn = [passenger_group_center_one,convoy_vehicle_center_one] Call Group_fnc_groupInVehicle; !isNil "_allIn" && { _allIn } };
waitUntil { private _allIn = [passenger_group_center_two,convoy_vehicle_center_two] Call Group_fnc_groupInVehicle; !isNil "_allIn" && { _allIn } };
waitUntil { private _allIn = [passenger_group_rear,convoy_vehicle_rear] Call Group_fnc_groupInVehicle; !isNil "_allIn" && { _allIn } };




// Dont speed up time when using convoys the ai does weird things then
waitUntil { private _set = [convoy_group,10,40,true] call Group_fnc_convoySetParameters; !isNil "_set" && { _set } };

_wp = convoy_group addWaypoint [[1887.92,5697.96,0],0];

_waypoints = waypoints convoy_group;
_index = _waypoints find _wp;
_currentIndex = currentWaypoint convoy_group;
while{((_index + 1) != _currentIndex)}do{
_currentIndex = currentWaypoint convoy_group;
sleep 0.001;
};

[passenger_group_front,[1890.68,5742.55,0]] call Group_fnc_groupGetOut;
[passenger_group_center_one,[1907.04,5639.88,0]] call Group_fnc_groupGetOut;
[passenger_group_center_two,[1968.99,5732.8,0]] call Group_fnc_groupGetOut;
[passenger_group_rear,[1967.06,5568.17,0]] call Group_fnc_groupGetOut;