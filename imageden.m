beta = 1;
pi = 0.15;
gamma = 0.5*log((1-pi)/pi);

itr = 1000000;

img_orig = imread('lenna.png');
img_noisy = img_orig.*(-1).^(rand(640,640) < pi);
img_final = img_noisy;
for i = 1:itr
    x = max(1,ceil(639*rand(1)));
    y = max(1,ceil(639*rand(1)));
    % exp(-ai) - Acceptance Probability
    sum = 0;
    for j = 1:3
        for k = 1:3
            sum = sum + img_final(max(x-2+j,1),max(y-2+k,1));
        end
    end
    ai = -2*gamma*img_noisy(x,y)*img_final(x,y) - 2*beta*img_final(x,y)*(sum - img_final(x,y));
    if log(rand(1)) < ai
        img_final(x,y) = - img_final(x,y);
    end
end

img = cat(2,img_noisy,img_final);
% imshow(img_final);
imshow(img);