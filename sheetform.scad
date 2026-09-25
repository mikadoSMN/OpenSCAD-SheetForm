module seet(){
	linear_extrude(2){
		square(150, 150, center = true);}}

size_of_block = [50, 50, 50];

module block(size_of_block){
	cube(size_of_block, center = true);}


module sheet_form(seet, block, ){
	union(){
		// (seet-block)の部分、両オブジェクトの位置は既に決められている
		linear_extrude(size_of_block[2]){
			difference(){
				projection(){
					seet();}
				projection(){
					block(size_of_block);}}}

		// blockに押された、底面、又は天面
		linear_extrude(size_of_block[2]){
			difference(){
				projection(){
					offset(2){
						block(size_of_block);}}

				projection(){
					block(size_of_block);}}}

		// 周りの部分
	}
}
