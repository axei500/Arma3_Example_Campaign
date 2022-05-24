// Dont speed up time when using convoys the ai does weird things then

[west, "task_1", ["Let the chopper transport you", "Get in chopper", "Chopper"], heli_land, "ASSIGNED", 2, true] call BIS_fnc_taskCreate;

waitUntil { player in heli_land };

["task_1","SUCCEEDED"] call BIS_fnc_taskSetState;

_wp = pilot_group_heli_transport addWaypoint [[1932.71,3538.35,0],0];

waitUntil {"task_1" call BIS_fnc_taskCompleted};

[west, "task_2", ["Heli will land here", "Wait for chopper to land", "Landing"], [1932.71,3538.35,0], "ASSIGNED", 2, true] call BIS_fnc_taskCreate;

_waypoints = waypoints pilot_group_heli_transport;
_index = _waypoints find _wp;
_currentIndex = currentWaypoint pilot_group_heli_transport;
while{((_index + 1) != _currentIndex)}do{
_currentIndex = currentWaypoint pilot_group_heli_transport;
sleep 0.001;
};

heli_land land "GET OUT";