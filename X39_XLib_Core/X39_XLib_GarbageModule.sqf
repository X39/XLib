/*
{if(count (units _x) <= 0) then {deleteGroup _x;}; false} count allGroups;
{deleteVehicle _x; false} count allMissionObjects "GroundWeaponHolder";
{deleteVehicle _x; false} count allDead;
*/
#include "\X39_GM_Insurgency\default.hpp"
private["_logic", "_houses", "_pos", "_overrideMapSize", "_minSpawnPositionsForBuildings", "_enemiesSide", "_typeOfX", "_avoidAreas", "_arr", "_maxUnitsPerPlayer", "_maxUnitsPerSquare", "_deathTimeout"];
_logic = _this select 0;
