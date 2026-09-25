block_size = [50, 50, 50];
smooth = true;
sheet_thickness = 2;

module sheet(){
	linear_extrude(thin_of_sheet){
		square(150, 150, center = true);}}

module block(size_of_block){
	cube(size_of_block, center = true);}

////////////////////////////////////////////////////

module sheet_form(
	sheet_thickness = 2,
	smooth = true){
	union(){
		linear_extrude(sheet_thickness){
			difference(){
				projection(){
					sheet();}
				
				projection(){
					block(block_size);}}}

		translate([0, 0, size_of_block[2]/2]){
			linear_extrude(sheet_thickness){
				difference(){
					projection(){
						sheet();}
					
					projection(){
						block(block_size);}}}}
	   
		linear_extrude(block_size[2]){
			difference(){
				projection(){

					if (smooth == true){
						offset(r = thin_of_sheet){
							block(block_size);}}
						else{
							offset(delta = thin_of_sheet){
								block(block_size);}}}

				projection(){
					block(block_size);}}}}}
