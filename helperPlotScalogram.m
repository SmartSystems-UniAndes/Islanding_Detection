function image = helperPlotScalogram(sig,Fs)
% This function is only intended to support this wavelet example.
% It may change or be removed in a future release.
cfs = abs(cwt(sig,Fs));
img = ind2rgb(im2uint8(rescale(cfs)),jet(128));
img = imresize(img,[224 224]);
%img(img > 1) = 1;
%img(img < 0) = 0;
image = img;
end