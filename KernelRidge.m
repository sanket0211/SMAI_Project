function final_ans = KernelRidge(in_data,out_data,test_data,lamda)

	tot_data = in_data;
	vec_test = test_data;
	x_in = zeros(size(tot_data,2),size(tot_data,2));
	%% x_in(i,j) = x_in(j,i) -- Using symmetry of the Kernel
for row = 1:size(x_in,2)
	for col = 1:row
	temp = sum((tot_data(:,row)-tot_data(:,col)).^2);
	x_in(row,col) = exp(-temp/2);
	end
	end
	x_in = x_in + x_in';
for count = 1:size(x_in,2)
	x_in(count,count) = x_in(count,count)/2;
	end

	%% Calculating alpha and the final answer
	final_ans = zeros(1,size(vec_test,2));
	if det(x_in + lamda*eye(size(x_in))) > 1e9
	fprintf('\nThe kernel matrix is poorly scaled. Please choose a better scaling parameter.');
	return
	end
	alpha = inv(x_in + lamda*eye(size(x_in)))*out_data';

for count1 = 1:size(vec_test,2)
	temp = 0;
for count2 = 1:size(alpha,1)
	temp1 = sum((vec_test(:,count1) - tot_data(:,count2)).^2);
	temp = temp + alpha(count2)*exp(-temp1/2);
	end
	final_ans(count1) = temp;
	end
	end
