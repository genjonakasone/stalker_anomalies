params[["_body",objNull]];

if(isNull _body) exitWith {};

if(isServer) then {
	_body hideObjectGlobal true;
	_body spawn {
		private _proxy = "Land_HelipadEmpty_F" createVehicle position _this;
		_proxy enableSimulationGlobal false;
		_proxy attachTo [_this, [0,0,0]];
		[_proxy, "anomaly_body_tear_1"] remoteExec ["say3D"];
		sleep 15;
		deleteVehicle _this;
		deleteVehicle _proxy;
	};
};

if(hasInterface) then {
	_source = "#particlesource" createVehicleLocal getPos _body;
	[_body, _source, "meat"] call anomalyEffect_fnc_meatgrinder;
	_source spawn {
		sleep 0.75;
		deleteVehicle _this;
	};
};