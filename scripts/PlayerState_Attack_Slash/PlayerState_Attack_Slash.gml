// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack_Slash(){
	horizontal_speed = 0;
	vertical_speed = 0;
	if(sprite_index != spr_attack_slash){
		sprite_index = spr_attack_slash;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	//Use attack hitbox & check for hits
	mask_index = spr_attack_slash_hb;
}