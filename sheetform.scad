size_of_block = [50, 50, 50];
smooth = true;
thin_of_sheet = 2;

module sheet(){
	linear_extrude(thin_of_sheet){
		square(150, 150, center = true);}}

module block(size_of_block){
	cube(size_of_block, center = true);}


module sheet_form(sheet, size_of_block, ){
	union(){
		// (sheet-block)の部分、両オブジェクトの位置は既に決められている
		linear_extrude(thin_of_sheet){
			difference(){
				projection(){
					sheet();}
				projection(){
					block(size_of_block);}}}

		// blockに押された、底面、又は天面
		translate([0, 0, size_of_block[2]]){
			linear_extrude(thin_of_sheet){
				difference(){
					projection(){
						sheet();}
					projection(){
						block(size_of_block);}}}}
	   
		// 周りの部分
		linear_extrude(size_of_block[2]){
			difference(){
				projection(){

					if (smooth = true){
							r_or_d = "r = thin_of_sheet"}
						else{
							r_or_d = "delta = thin_of_sheet"}

					offset(r_or_d){
						block(size_of_block);}}

				projection(){
					block(size_of_block);}}}}}
