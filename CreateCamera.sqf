_type = _this select 0;
_effectName = _this select 1;
_effectPosition = _this select 2;

// For te sake of not having to run after the car well set up a camera here
// found this here https://forums.bohemia.net/forums/topic/51591-camera-to-follow-a-rocket/
// https://community.bistudio.com/wiki/camCreate
_camera = _Type camCreate [0,0,0];
// https://community.bistudio.com/wiki/cameraEffect
_camera cameraeffect [_effectName, _effectPosition];