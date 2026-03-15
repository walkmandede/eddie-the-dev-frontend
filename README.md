# eddie_the_dev_frontend

A portfolio website for Eddie developed with Flutter.


# To Add Content

If you want to add new content, there are two folders under 'lib/core/data/contents' - 'data' and 'model'.
You can add new content in data or update blueprints of models

# Menus
There is an enum for that in HomePageController class under 'lib/src/features/home/home_page_controller.dart'.
You can add or update enums there and update UI in HomePage accordingly.

# Assets and SVGs
There are two additonal way to render icons other than material ones.

1. Assets

If you want to add asset images,
- add image under 'assets/images/'
- add new variable for that asset in AppAsset class under 'lib/core/constants/app_assets.dart',
- use it in Image.asset

2. SVGs
* only work with svg string
- add new variable with svg string value in AppSvgs class under 'lib/core/constants/app_svgs.dart',
- use it with SvgPicture.string()

