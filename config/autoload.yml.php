#!php 
#<?php die('NOPE'); ?>
--- # Keys are alias name, path is relative to /lib/ and the prefix is optimization, discards classes with a different prefix in their classname
all:
  kx:
    autoload:
      load:
        PDO: { path: PDO, prefix: PDO_ }
        Twig: { path: Twig, prefix: Twig }
