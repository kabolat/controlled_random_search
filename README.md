# MATLAB Implementation of Controlled Random Search

Controlled Random Search (CRS) is one of the earliest approaches for the global optimization algorithms and it is found by W. L. Price in [\[1\]]. It is an extension of a simple random search method, where it is excepted the optimum point is the best point among a number of randomly selected points within the search space. Price combined this methodology with Nelder and Mead’s simplex method so that an iterative approach can be applied and exploitation can be achieved. Later, this method has been advanced in [\[2\]] as CRS2 for better exploitation. This repository consists of the MATLAB implementations of CRS1 ([crs1.m]) and CRS2 ([crs2.m]) as well as their 2-D demonstrations ([CRS1_2dim.m], [CRS2_2dim.m]) with a selection of benchmark target functions ([bukin.m], [holder.m], [happycat.m], [rosenbrock.m]). 


[//]: # 
   [\[1\]]: <https://academic.oup.com/comjnl/article/20/4/367/393971>
   [\[2\]]: <https://link.springer.com/article/10.1007/BF00933504>
   [crs1.m]: <https://github.com/kabolat/controlled_random_search/blob/main/crs1.m>
   [crs2.m]: <https://github.com/kabolat/controlled_random_search/blob/main/crs2.m>
   [CRS1_2dim.m]: <https://github.com/kabolat/controlled_random_search/blob/main/CRS1_2dim.m>
   [CRS2_2dim.m]: <https://github.com/kabolat/controlled_random_search/blob/main/CRS2_2dim.m>
   [bukin.m]: <https://github.com/kabolat/controlled_random_search/blob/main/bukin.m>
   [holder.m]: <https://github.com/kabolat/controlled_random_search/blob/main/holder.m>
   [happycat.m]: <https://github.com/kabolat/controlled_random_search/blob/main/happycat.m>
   [rosenbrock.m]: <https://github.com/kabolat/controlled_random_search/blob/main/rosenbrock.m>
