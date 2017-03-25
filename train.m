images = dir('/home/raj/IIIT/fifthsem/SMAI/project/data/*.*pg');
							 data = [];
							 u_space = [];
							 v_space = [];
							 blocksize = 10;
							 resize_factor = 0.8;
							 k_factor = 100;
							 m_factor = 10 ; 
							 seradius = 1;


							 display ('Total number of images '); display(length(images));
							 cd '/home/raj/IIIT/fifthsem/SMAI/project/data';
							 for i = [1:length(images)]
							 im = imread(images(i).name);
							 im = imresize(im,resize_factor);
							 [l, Am, Sp, d] = slic(im, k_factor,m_factor,seradius);
							 end

