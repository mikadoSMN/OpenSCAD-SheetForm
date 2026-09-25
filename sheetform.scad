// block_size = [50, 50, 50];
// smooth = true;
// sheet_thickness = 2;

// module sheet(){
// 	linear_extrude(thin_of_sheet){
// 		square(150, 150, center = true);}}

// module block(size_of_block){
// 	cube(size_of_block, center = true);}

////////////////////////////////////////////////////

module sheet_form(
	block_height,
	sheet_thickness = 2,
	smooth = true){
	union(){
		linear_extrude(sheet_thickness){
			difference(){
				projection(){
					// sheet();
					children(0);}
				
				projection(){
					// block(block_size);
					children(1);}}}

		translate([0, 0, block_height]){
			linear_extrude(sheet_thickness){
				difference(){
					projection(){
						// sheet();
						children(0);}
					
					projection(){
						// block(block_size);
						children(1);}}}}
	   
		linear_extrude(block_height){
			difference(){
					if (smooth == true){
						projection(){
							offset(r = sheet_thickness){
								// block(block_size);
								children(1);)}}
						else{
							projection(){
								offset(delta = sheet_thickness){
									// block(block_size);
									children(1);}}}

				projection(){
					// block(block_size);
					children(1);}}}}


// example //
// module sheet(){
// 	linear_extrude(2)
// 		square([150,150], center=true);}

// module block(){
// 	cube([50,50,50], center=false);}

// sheet_form(
// 	block_height = 50,
// 	sheet_thickness = 2,
// 	smooth = true){
// 	sheet(); // children(0)
// 	block(); // children(1)
// }
