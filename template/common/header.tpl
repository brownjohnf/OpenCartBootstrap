<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- LOADS THE DEFAULT STYLESHEET -->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/bootstrap/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<!-- LOADS THE DEFAULT TWITTER BOOTSTRAP JS -->
<script type="text/javascript" src="catalog/view/theme/bootstrap/javascript/bootstrap.min.js"></script>

<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<?php echo $google_analytics; ?>
</head>
<body>

<div id="container" class="container"><!-- is closed in common/footer.tpl -->
  <div id="header">
    <div class="row">
      <div class="span4">
        <?php if ($logo) { ?>
          <div id="logo"><a href="<?php echo $home; ?>">
            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
          </div>
        <?php } ?>
      </div>
      <div class="span4">
        <p id="welcome" class="right">
          <?php if (!$logged) { ?>
          <?php echo $text_welcome; ?>
          <?php } else { ?>
          <?php echo $text_logged; ?>
          <?php } ?>
        </p>
      </div>
      <div class="span4">
        <?php echo $cart; ?>
      </div>
    </div>
    <div class="navbar">
      <div class="navbar-inner">
        <?php //echo $language; ?>
        <?php //echo $currency; ?>

        <form class="form-search navbar-search pull-right" action="<?php echo $base.'index.php?route=product/search'; ?>" method="get">
          <input type="hidden" name="route" value="product/search"/>
          <div class="input-append">
            <input name="filter_name" type="text" class="span2 search-query" placeholder="<?php echo $text_search; ?>" value="<?php if ($filter_name) {echo $filter_name;} ?>">
            <button type="submit" class="btn">Search</button>
          </div>
        </form>
       
        <ul class="links nav">
          <li>
            <a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
          </li>
          <li>
            <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
          </li>
          <li>
            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
          </li>
          <li>
            <a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
          </li>
          <li>
            <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <?php if ($categories) { ?>
    <ul id="menu" class="nav nav-tabs">
      <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
          <li class="dropdown">
            <a href="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?><b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="<?php echo $category['href']; ?>">All <?php echo $category['name']; ?></a>
              <li class="divider"></li>
              <?php for ($i = 0; $i < count($category['children']);) { ?>
                <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                <?php for (; $i < $j; $i++) { ?>
                  <?php if (isset($category['children'][$i])) { ?>
                    <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            </ul>
          <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
        </li>
      <?php } ?>
    </ul>
  <?php } ?>

  <div id="notification"></div>
