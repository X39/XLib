/**
 *	Created for usage with HandleDamage event handler
 *	Returns UNKNOWN, BULLET, GRENADE, SHELL or EXPLOSIVE depending on the projectile type
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT/STRING - projectile to check
 *	@Return - STRING - UNKNOWN, BULLET, GRENADE, SHELL or EXPLOSIVE depending on the projectile type
 *	@Author - X39|Cpt. HM Murdock
 */
_projectile = [_this, 0, ["", objNull], nil] call BIS_fnc_param;

if(isNil "_projectile")						exitWith { "UNKNOWN" };
if(_projectile iskindof "BulletBase")		exitWith { "BULLET" };
if(_projectile iskindof "GrenadeCore")		exitWith { "GRENADE" };
if(_projectile iskindof "GrenadeLauncher")	exitWith { "GRENADE" };
if(_projectile iskindof "ShellBase")		exitWith { "SHELL" };
if(_projectile iskindof "TimeBombCore")		exitWith { "EXPLOSIVE" };
if(_projectile iskindof "MineCore")			exitWith { "EXPLOSIVE" };
if(_projectile iskindof "FuelExplosion")	exitWith { "EXPLOSIVE" };
if(_projectile iskindof "RocketBase")		exitWith { "EXPLOSIVE" };
if(_projectile iskindof "MissileBase")		exitWith { "EXPLOSIVE" };
if(_projectile iskindof "LaserBombCore")	exitWith { "EXPLOSIVE" };
if(_projectile iskindof "BombCore")			exitWith { "EXPLOSIVE" };
"UNKNOWN"