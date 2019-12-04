if(global.inMenu == false){
	if (keyboard_check(ord("W"))) {
		y = y - boatSpeed * momentum;
		image_angle = 0;
		if(momentum <= speedlimit){
			momentum += 0.01;
		}
	}
	if (keyboard_check(ord("S"))) {
		y = y + boatSpeed * momentum;
		image_angle = 180;
		if(momentum <= speedlimit){
			momentum += 0.01;
		}
	}
	if (keyboard_check(ord("A"))) {
		x = x - boatSpeed * momentum;
		image_angle = 90;
		if(momentum <= speedlimit){
			momentum += 0.01;
		}
	}
	if (keyboard_check(ord("D"))) {
		x = x + boatSpeed * momentum;
		image_angle = 270;
		if(momentum <= speedlimit){
			momentum += 0.01;
		}
	}
	if (keyboard_check(ord("W")) && keyboard_check(ord("D"))) {
		image_angle = 315;
	}
	if (keyboard_check(ord("W")) && keyboard_check(ord("A"))) {
		image_angle = 45;
	}
	if (keyboard_check(ord("A")) && keyboard_check(ord("S"))) {
		image_angle = 135;
	}
	if (keyboard_check(ord("S")) && keyboard_check(ord("D"))) {
		image_angle = 225;
	}

	if(keyboard_check(ord("W")) or keyboard_check(ord("D")) or keyboard_check(ord("S")) or keyboard_check(ord("A"))){
		//none
	} else{
		halfmomentum = momentum / 2;
		if(momentum < 0){
			momentum = 0;
		}
		if (momentum > 0){ 
			momentum -= 0.02;
			if(keyboard_check(vk_shift)){
				momentum -= 0.06;
			}
		}
		if(image_angle == 0){
			y = y - momentum;
		}else if(image_angle == 45){
			x = x - halfmomentum;
			y = y - halfmomentum;
		}else if(image_angle == 90){
			x = x - momentum;
		}else if(image_angle == 135){
			x = x - halfmomentum;
			y = y + halfmomentum;
		}else if(image_angle == 180){
			y = y + momentum;
		}else if(image_angle == 225){
			x = x + halfmomentum;
			y = y + halfmomentum;
		}else if(image_angle == 270){
			x = x + momentum;
		}else if(image_angle == 315){
			x = x + halfmomentum;
			y = y - halfmomentum;
		}
	}
	
	//shooting
	
	if(keyboard_check_released(vk_space) || mouse_check_button_released(mb_left)){
		if(level == 1){
			instance_create_layer(x, y, layer, oCannonBall);
		} else if(level == 2){
			instance_create_layer(x, y, layer, oCannonBall);
			instance_create_layer(x, y, layer, oCannonBall2);
		} else if(level >= 3){
			instance_create_layer(x, y, layer, oCannonBall);
			instance_create_layer(x, y, layer, oCannonBall2);
			instance_create_layer(x, y, layer, oCannonBall3);
			instance_create_layer(x, y, layer, oCannonBall4);
		}
	}
	
	
	//Turrets
	
	if(keyboard_check_released(ord("1")) && level >= 4 && rTurrets > 0){
		rTurrets -= 1;
		instance_create_layer(x + 20, y, layer, oRTurretGun);
	}
}


if(hp <= 0){
	room_goto(gameOver);
}