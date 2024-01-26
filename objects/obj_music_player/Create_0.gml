audio_stop_all();

if(room == TitleScreen){
	audio_play_sound(snd_ranger_theme, 10, true);
} else if(room == GameOver){
	audio_play_sound(snd_strumming, 10, true);
} else {
	audio_play_sound(snd_rides_again, 10, true);	
}

