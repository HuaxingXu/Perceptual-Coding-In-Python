function [Nc, fc, fl, fu, dz] = PQCB (Version)
% Critical band parameters for the FFT model

% P. Kabal $Revision: 1.1 $  $Date: 2003/12/07 13:32:57 $

B = inline ('7 * asinh (f / 650)');
BI = inline ('650 * sinh (z / 7)');

fL = 80;
fU = 18000;

% Critical bands - set up the tables
if (strcmp (Version, 'Basic'))
    dz = 1/4;
elseif (strcmp (Version, 'Advanced'))
    dz = 1/2;
else
    error ('PQCB: Invalid version');
end

zL = B(fL);
zU = B(fU);
Nc = ceil((zU - zL) / dz);
zl = zL + (0:Nc-1) * dz;
zu = min (zL + (1:Nc) * dz, zU);
zc = 0.5 * (zl + zu);

fl = BI (zl);
fc = BI (zc);
fu = BI (zu);

if (strcmp (Version, 'Basic'))
    fl = [  80.000,   103.445,   127.023,   150.762,   174.694, \
           198.849,   223.257,   247.950,   272.959,   298.317, \
           324.055,   350.207,   376.805,   403.884,   431.478, \
           459.622,   488.353,   517.707,   547.721,   578.434, \
           609.885,   642.114,   675.161,   709.071,   743.884, \
           779.647,   816.404,   854.203,   893.091,   933.119, \
           974.336,  1016.797,  1060.555,  1105.666,  1152.187, \
          1200.178,  1249.700,  1300.816,  1353.592,  1408.094, \
          1464.392,  1522.559,  1582.668,  1644.795,  1709.021, \
          1775.427,  1844.098,  1915.121,  1988.587,  2064.590, \
          2143.227,  2224.597,  2308.806,  2395.959,  2486.169, \
          2579.551,  2676.223,  2776.309,  2879.937,  2987.238, \
          3098.350,  3213.415,  3332.579,  3455.993,  3583.817, \
          3716.212,  3853.817,  3995.399,  4142.547,  4294.979, \
          4452.890,  4616.482,  4785.962,  4961.548,  5143.463, \
          5331.939,  5527.217,  5729.545,  5939.183,  6156.396, \
          6381.463,  6614.671,  6856.316,  7106.708,  7366.166, \
          7635.020,  7913.614,  8202.302,  8501.454,  8811.450, \
          9132.688,  9465.574,  9810.536, 10168.013, 10538.460, \
         10922.351, 11320.175, 11732.438, 12159.670, 12602.412, \
         13061.229, 13536.710, 14029.458, 14540.103, 15069.295, \
         15617.710, 16186.049, 16775.035, 17385.420 ];
    fc = [  91.708,   115.216,   138.870,   162.702,   186.742, \
           211.019,   235.566,   260.413,   285.593,   311.136, \
           337.077,   363.448,   390.282,   417.614,   445.479, \
           473.912,   502.950,   532.629,   562.988,   594.065, \
           625.899,   658.533,   692.006,   726.362,   761.644, \
           797.898,   835.170,   873.508,   912.959,   953.576, \
           995.408,  1038.511,  1082.938,  1128.746,  1175.995, \
          1224.744,  1275.055,  1326.992,  1380.623,  1436.014, \
          1493.237,  1552.366,  1613.474,  1676.641,  1741.946, \
          1809.474,  1879.310,  1951.543,  2026.266,  2103.573, \
          2183.564,  2266.340,  2352.008,  2440.675,  2532.456, \
          2627.468,  2725.832,  2827.672,  2933.120,  3042.309, \
          3155.379,  3272.475,  3393.745,  3519.344,  3649.432, \
          3784.176,  3923.748,  4068.324,  4218.090,  4373.237, \
          4533.963,  4700.473,  4872.978,  5051.700,  5236.866, \
          5428.712,  5627.484,  5833.434,  6046.825,  6267.931, \
          6497.031,  6734.420,  6980.399,  7235.284,  7499.397, \
          7773.077,  8056.673,  8350.547,  8655.072,  8970.639, \
          9297.648,  9636.520,  9987.683, 10351.586, 10728.695, \
         11119.490, 11524.470, 11944.149, 12379.066, 12829.775, \
         13294.850, 13780.887, 14282.503, 14802.338, 15341.057, \
         15899.345, 16477.914, 17077.504, 17690.045 ];
    fu = [ 103.445,   127.023,   150.762,   174.694,   198.849, \
           223.257,   247.950,   272.959,   298.317,   324.055, \
           350.207,   376.805,   403.884,   431.478,   459.622, \
           488.353,   517.707,   547.721,   578.434,   609.885, \
           642.114,   675.161,   709.071,   743.884,   779.647, \
           816.404,   854.203,   893.091,   933.113,   974.336, \
          1016.797,  1060.555,  1105.666,  1152.187,  1200.178, \
          1249.700,  1300.816,  1353.592,  1408.094,  1464.392, \
          1522.559,  1582.668,  1644.795,  1709.021,  1775.427, \
          1844.098,  1915.121,  1988.587,  2064.590,  2143.227, \
          2224.597,  2308.806,  2395.959,  2486.169,  2579.551, \
          2676.223,  2776.309,  2879.937,  2987.238,  3098.350, \
          3213.415,  3332.579,  3455.993,  3583.817,  3716.212, \
          3853.348,  3995.399,  4142.547,  4294.979,  4452.890, \
          4643.482,  4785.962,  4961.548,  5143.463,  5331.939, \
          5527.217,  5729.545,  5939.183,  6156.396,  6381.463, \
          6614.671,  6856.316,  7106.708,  7366.166,  7635.020, \
          7913.614,  8202.302,  8501.454,  8811.450,  9132.688, \
          9465.574,  9810.536, 10168.013, 10538.460, 10922.351, \
         11320.175, 11732.438, 12159.670, 12602.412, 13061.229, \
         13536.710, 14029.458, 14540.103, 15069.295, 15617.710, \
         16186.049, 16775.035, 17385.420, 18000.000 ];
end
