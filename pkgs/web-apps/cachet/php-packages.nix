{composerEnv, src, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "alt-three/bus" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "alt-three-bus-21d1623520c0ad48acb72420fd7f986cd23f349a";
        src = fetchurl {
          url = "https://api.github.com/repos/AltThree/Bus/zipball/21d1623520c0ad48acb72420fd7f986cd23f349a";
          sha256 = "1gw9r7awcnam7lmxgq8wq66fi3bs5a3jcmknzm5m9wsvc995zpkk";
        };
      };
    };
    "alt-three/validator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "alt-three-validator-65ffc90cda5589052f0dac124d588946dfffd803";
        src = fetchurl {
          url = "https://api.github.com/repos/AltThree/Validator/zipball/65ffc90cda5589052f0dac124d588946dfffd803";
          sha256 = "0bgyfdd5hyr2jl9a2mgh70hi8j1bkpraaawzfq5ika7b39pflz0y";
        };
      };
    };
    "asm89/stack-cors" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "asm89-stack-cors-b9c31def6a83f84b4d4a40d35996d375755f0e08";
        src = fetchurl {
          url = "https://api.github.com/repos/asm89/stack-cors/zipball/b9c31def6a83f84b4d4a40d35996d375755f0e08";
          sha256 = "0629c22fhvkvbq6xgfkaain7cy67lfkrlny26l2665gsrdlyhm6a";
        };
      };
    };
    "aws/aws-sdk-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "aws-aws-sdk-php-02aaf7007c5678a6358ea924cd85531300aa1747";
        src = fetchurl {
          url = "https://api.github.com/repos/aws/aws-sdk-php/zipball/02aaf7007c5678a6358ea924cd85531300aa1747";
          sha256 = "0psj3ibdkw6bznd6n2p9p6vdsra9pr9m8man4kb25fnhfkq7sa00";
        };
      };
    };
    "barryvdh/laravel-cors" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "barryvdh-laravel-cors-03492f1a3bc74a05de23f93b94ac7cc5c173eec9";
        src = fetchurl {
          url = "https://api.github.com/repos/fruitcake/laravel-cors/zipball/03492f1a3bc74a05de23f93b94ac7cc5c173eec9";
          sha256 = "0lz65afgbr8hlylnl4mqryzgqqh7m9i2rs0yf9msw9wpykblli7c";
        };
      };
    };
    "bugsnag/bugsnag" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "bugsnag-bugsnag-5a62ea2449e090ac103b1e9883a8fc33567d4241";
        src = fetchurl {
          url = "https://api.github.com/repos/bugsnag/bugsnag-php/zipball/5a62ea2449e090ac103b1e9883a8fc33567d4241";
          sha256 = "10r5x1xa4p926v0z9i2rg4463v9j8m7shjzkmrvbksasixn7d5bm";
        };
      };
    };
    "bugsnag/bugsnag-laravel" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "bugsnag-bugsnag-laravel-b470a34b2b6ba33b2aa4ef1a01c64843ae8ab91b";
        src = fetchurl {
          url = "https://api.github.com/repos/bugsnag/bugsnag-laravel/zipball/b470a34b2b6ba33b2aa4ef1a01c64843ae8ab91b";
          sha256 = "1xd942s4mrdrbw0v6fcx301k8vim8smrfvln3kl8znhx2n6jdvsg";
        };
      };
    };
    "bugsnag/bugsnag-psr-logger" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "bugsnag-bugsnag-psr-logger-222a7338bc5c39833c7c3922a175c539e996797c";
        src = fetchurl {
          url = "https://api.github.com/repos/bugsnag/bugsnag-psr-logger/zipball/222a7338bc5c39833c7c3922a175c539e996797c";
          sha256 = "1s2qv4d1q2scjx803m4fzpwcwgv98d6j31ffc9biw2bwwyl7f2c9";
        };
      };
    };
    "cachethq/badger" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cachethq-badger-9d7f9e8f8529d902f3a30ad120a403a7ba2da1e3";
        src = fetchurl {
          url = "https://api.github.com/repos/CachetHQ/Badger/zipball/9d7f9e8f8529d902f3a30ad120a403a7ba2da1e3";
          sha256 = "1jcpd5ajs0flwfpmbb5qgp59is37zlcp8kqfis4i9qydai718zdn";
        };
      };
    };
    "cachethq/emoji" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cachethq-emoji-45227616c9b8077deeefe5561035e219b4118233";
        src = fetchurl {
          url = "https://api.github.com/repos/CachetHQ/Emoji/zipball/45227616c9b8077deeefe5561035e219b4118233";
          sha256 = "1j8kjnzw0wqzkimwlrkr14bj5am94pim1jq9hap1scgsxdfv53cd";
        };
      };
    };
    "cachethq/twitter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cachethq-twitter-81216cbc3c1f1a32df70bfb73837f59a35a22b1c";
        src = fetchurl {
          url = "https://api.github.com/repos/CachetHQ/Twitter/zipball/81216cbc3c1f1a32df70bfb73837f59a35a22b1c";
          sha256 = "1ln9q11p7h21k7pv6y1a2qw0q4yd4fy0xldh91gpwkjbysc62b69";
        };
      };
    };
    "chillerlan/php-qrcode" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "chillerlan-php-qrcode-bf0382aaf2f79fa41c2dcb0f216675f74d633fe7";
        src = fetchurl {
          url = "https://api.github.com/repos/chillerlan/php-qrcode/zipball/bf0382aaf2f79fa41c2dcb0f216675f74d633fe7";
          sha256 = "1f7isqswcj2gprmr24nvhspcpp85zarnzaic6d4id83zbmkqkb3h";
        };
      };
    };
    "chillerlan/php-traits" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "chillerlan-php-traits-264759946b6aaeb427346b749fc9639b790b8e7f";
        src = fetchurl {
          url = "https://api.github.com/repos/chillerlan/php-traits/zipball/264759946b6aaeb427346b749fc9639b790b8e7f";
          sha256 = "0ysp5hy6vpy2qjszwn8wlcsw599a8ar150fyf5l1ldrpy6n8bk0d";
        };
      };
    };
    "composer/ca-bundle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-ca-bundle-78a0e288fdcebf92aa2318a8d3656168da6ac1a5";
        src = fetchurl {
          url = "https://api.github.com/repos/composer/ca-bundle/zipball/78a0e288fdcebf92aa2318a8d3656168da6ac1a5";
          sha256 = "0fqx8cn7b0mrc7mvp8mdrl4g0y65br6wrbhizp4mk1qc7rf0xrvk";
        };
      };
    };
    "dnoegel/php-xdg-base-dir" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "dnoegel-php-xdg-base-dir-8f8a6e48c5ecb0f991c2fdcf5f154a47d85f9ffd";
        src = fetchurl {
          url = "https://api.github.com/repos/dnoegel/php-xdg-base-dir/zipball/8f8a6e48c5ecb0f991c2fdcf5f154a47d85f9ffd";
          sha256 = "02n4b4wkwncbqiz8mw2rq35flkkhn7h6c0bfhjhs32iay1y710fq";
        };
      };
    };
    "doctrine/cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-cache-13e3381b25847283a91948d04640543941309727";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/cache/zipball/13e3381b25847283a91948d04640543941309727";
          sha256 = "088fxbpjssp8x95qr3ip2iynxrimimrby03xlsvp2254vcyx94c5";
        };
      };
    };
    "doctrine/dbal" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-dbal-7345cd59edfa2036eb0fa4264b77ae2576842035";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/dbal/zipball/7345cd59edfa2036eb0fa4264b77ae2576842035";
          sha256 = "1qcw35186lc8si0zzcph3mpv21qhqj4iynrld6bdiwfqzd1lyycs";
        };
      };
    };
    "doctrine/event-manager" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-event-manager-41370af6a30faa9dc0368c4a6814d596e81aba7f";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/event-manager/zipball/41370af6a30faa9dc0368c4a6814d596e81aba7f";
          sha256 = "0pn2aiwl4fvv6fcwar9alng2yrqy8bzc58n4bkp6y2jnpw5gp4m8";
        };
      };
    };
    "doctrine/inflector" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-inflector-ec3a55242203ffa6a4b27c58176da97ff0a7aec1";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/inflector/zipball/ec3a55242203ffa6a4b27c58176da97ff0a7aec1";
          sha256 = "18i6zyd5bh5zazgqr3c9bwi7s5vhm9wpnn2hd8vp8vgdp9x7f4hb";
        };
      };
    };
    "doctrine/lexer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-lexer-1febd6c3ef84253d7c815bed85fc622ad207a9f8";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/lexer/zipball/1febd6c3ef84253d7c815bed85fc622ad207a9f8";
          sha256 = "0ndvnx841cqr3myvvv4j7isyiaz6zmp2g8lpc42q5gqi1rv4n8vj";
        };
      };
    };
    "dragonmantank/cron-expression" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "dragonmantank-cron-expression-65b2d8ee1f10915efb3b55597da3404f096acba2";
        src = fetchurl {
          url = "https://api.github.com/repos/dragonmantank/cron-expression/zipball/65b2d8ee1f10915efb3b55597da3404f096acba2";
          sha256 = "07yqbhf6n4d818gvla60mgg23gichwiafd5ypd70w4b4dlbcxcpl";
        };
      };
    };
    "egulias/email-validator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "egulias-email-validator-0dbf5d78455d4d6a41d186da50adc1122ec066f4";
        src = fetchurl {
          url = "https://api.github.com/repos/egulias/EmailValidator/zipball/0dbf5d78455d4d6a41d186da50adc1122ec066f4";
          sha256 = "00kwb8rhk1fq3a1i152xniipk3y907q1v5r3szqbkq5rz82dwbck";
        };
      };
    };
    "erusev/parsedown" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "erusev-parsedown-cb17b6477dfff935958ba01325f2e8a2bfa6dab3";
        src = fetchurl {
          url = "https://api.github.com/repos/erusev/parsedown/zipball/cb17b6477dfff935958ba01325f2e8a2bfa6dab3";
          sha256 = "1iil9v8g03m5vpxxg3a5qb2sxd1cs5c4p5i0k00cqjnjsxfrazxd";
        };
      };
    };
    "fideloper/proxy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "fideloper-proxy-c073b2bd04d1c90e04dc1b787662b558dd65ade0";
        src = fetchurl {
          url = "https://api.github.com/repos/fideloper/TrustedProxy/zipball/c073b2bd04d1c90e04dc1b787662b558dd65ade0";
          sha256 = "05jzgjj4fy5p1smqj41b5qxj42zn0mnczvsaacni4fmq174mz4gy";
        };
      };
    };
    "graham-campbell/binput" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-binput-9c0df9c3d0481a495bdc0638ee67bc199d70e3b4";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Laravel-Binput/zipball/9c0df9c3d0481a495bdc0638ee67bc199d70e3b4";
          sha256 = "03n56j36x39n8mwz0sjaj87m1nswha1fvz5s0rr9pffwwgax89xf";
        };
      };
    };
    "graham-campbell/exceptions" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-exceptions-c33548417cf9903a049c7311ab57352a7e720b33";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Laravel-Exceptions/zipball/c33548417cf9903a049c7311ab57352a7e720b33";
          sha256 = "0agmzycys6mwradpaary5vmbwhravjlv9jr0sxz8jbhisx71ddbp";
        };
      };
    };
    "graham-campbell/guzzle-factory" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-guzzle-factory-618cf7220b177c6d9939a36331df937739ffc596";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Guzzle-Factory/zipball/618cf7220b177c6d9939a36331df937739ffc596";
          sha256 = "078kgakcnn90blc4bijxmk516wwarg1bsnsm1q0kw3gf3aa7dwk5";
        };
      };
    };
    "graham-campbell/markdown" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-markdown-7ead48c43098b562707a30650843d4279786b0d9";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Laravel-Markdown/zipball/7ead48c43098b562707a30650843d4279786b0d9";
          sha256 = "0ihmb8w2c3bgqbfmjb0s36q4yg6gz9b0ff0h0b2zjy4ylh2253mc";
        };
      };
    };
    "graham-campbell/security" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-security-93b3e09774987916f9a91071b2e53738180f2ba8";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Laravel-Security/zipball/93b3e09774987916f9a91071b2e53738180f2ba8";
          sha256 = "02l2c44qij0ib79ylx9blbbx233bn2dsvkdb6170x1pxr5lq80aa";
        };
      };
    };
    "graham-campbell/security-core" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-security-core-3b14e58dba84b0238a3409818d6f67acc5c00bf9";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Security-Core/zipball/3b14e58dba84b0238a3409818d6f67acc5c00bf9";
          sha256 = "1plqbi85v8cpl7sifnpv13i1zr368aiwflypb4hf5v72i3l2hff3";
        };
      };
    };
    "guzzlehttp/guzzle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-guzzle-9d4290de1cfd701f38099ef7e183b64b4b7b0c5e";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/guzzle/zipball/9d4290de1cfd701f38099ef7e183b64b4b7b0c5e";
          sha256 = "1dlrdpil0173cmx73ghy8iis2j0lk00dzv3n166d0riky21n8djb";
        };
      };
    };
    "guzzlehttp/promises" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-promises-60d379c243457e073cff02bc323a2a86cb355631";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/promises/zipball/60d379c243457e073cff02bc323a2a86cb355631";
          sha256 = "0lvcr64bx9sb90qggxk7g7fsplz403gm3i8lnlcaifyjrlmdj5wb";
        };
      };
    };
    "guzzlehttp/psr7" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-psr7-53330f47520498c0ae1f61f7e2c90f55690c06a3";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/psr7/zipball/53330f47520498c0ae1f61f7e2c90f55690c06a3";
          sha256 = "0948mbbqn1xcz39diajhvlr9a7586vx3091kzx96m0z4ki3lhv7g";
        };
      };
    };
    "jakub-onderka/php-console-color" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jakub-onderka-php-console-color-d5deaecff52a0d61ccb613bb3804088da0307191";
        src = fetchurl {
          url = "https://api.github.com/repos/JakubOnderka/PHP-Console-Color/zipball/d5deaecff52a0d61ccb613bb3804088da0307191";
          sha256 = "0ih1sa301sda03vqsbg28mz44azii1l0adsjp94p6lhgaawyj4rn";
        };
      };
    };
    "jakub-onderka/php-console-highlighter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jakub-onderka-php-console-highlighter-9f7a229a69d52506914b4bc61bfdb199d90c5547";
        src = fetchurl {
          url = "https://api.github.com/repos/JakubOnderka/PHP-Console-Highlighter/zipball/9f7a229a69d52506914b4bc61bfdb199d90c5547";
          sha256 = "1wgk540dkk514vb6azn84mygxy92myi1y27l9la6q24h0hb96514";
        };
      };
    };
    "jenssegers/date" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jenssegers-date-58393b0544fc2525b3fcd02aa4c989857107e05a";
        src = fetchurl {
          url = "https://api.github.com/repos/jenssegers/date/zipball/58393b0544fc2525b3fcd02aa4c989857107e05a";
          sha256 = "1ccw77v3jj2ai9ysyh5fczmh2jdr1mksqvi67brgaqh32rswymzl";
        };
      };
    };
    "kylekatarnls/update-helper" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "kylekatarnls-update-helper-429be50660ed8a196e0798e5939760f168ec8ce9";
        src = fetchurl {
          url = "https://api.github.com/repos/kylekatarnls/update-helper/zipball/429be50660ed8a196e0798e5939760f168ec8ce9";
          sha256 = "02lzagbgykk5bqqa203vkyh6xxblvsg6d8sfgsrzp0g228my4qpz";
        };
      };
    };
    "laravel/framework" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laravel-framework-2555bf6ef6e6739e5f49f4a5d40f6264c57abd56";
        src = fetchurl {
          url = "https://api.github.com/repos/laravel/framework/zipball/2555bf6ef6e6739e5f49f4a5d40f6264c57abd56";
          sha256 = "018kw9xwy358dd6icsw8ffk8wa7g8vdhpljwncm52bsbgf1zjw8g";
        };
      };
    };
    "laravel/nexmo-notification-channel" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laravel-nexmo-notification-channel-03edd42a55b306ff980c9950899d5a2b03260d48";
        src = fetchurl {
          url = "https://api.github.com/repos/laravel/nexmo-notification-channel/zipball/03edd42a55b306ff980c9950899d5a2b03260d48";
          sha256 = "1qwy8g42wd1s6a7hq4azx3gahd97c8mmgxbdlvapf1m41njs2wzx";
        };
      };
    };
    "laravel/slack-notification-channel" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laravel-slack-notification-channel-6e164293b754a95f246faf50ab2bbea3e4923cc9";
        src = fetchurl {
          url = "https://api.github.com/repos/laravel/slack-notification-channel/zipball/6e164293b754a95f246faf50ab2bbea3e4923cc9";
          sha256 = "0v1l7kjpnjs3zv5mjpa1w8rhxciipdlcvqs2cbd80h2inwg55dq0";
        };
      };
    };
    "laravel/tinker" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laravel-tinker-ad571aacbac1539c30d480908f9d0c9614eaf1a7";
        src = fetchurl {
          url = "https://api.github.com/repos/laravel/tinker/zipball/ad571aacbac1539c30d480908f9d0c9614eaf1a7";
          sha256 = "16s11nlzwpiqqs94qn5szrk6nwcxqlhpcbcbd9phlv174lpap9ng";
        };
      };
    };
    "lcobucci/jwt" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "lcobucci-jwt-17cb82dd625ccb17c74bf8f38563d3b260306483";
        src = fetchurl {
          url = "https://api.github.com/repos/lcobucci/jwt/zipball/17cb82dd625ccb17c74bf8f38563d3b260306483";
          sha256 = "0jf1dm8rlrdirnay6ck4gbiwsdnsc9jf4j9imyblf9k0scqc3kkl";
        };
      };
    };
    "league/commonmark" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "league-commonmark-11df9b36fd4f1d2b727a73bf14931d81373b9a54";
        src = fetchurl {
          url = "https://api.github.com/repos/thephpleague/commonmark/zipball/11df9b36fd4f1d2b727a73bf14931d81373b9a54";
          sha256 = "15chm1sa65b58b47am00ik03s2agnx49i8yww3mhqlijvbrjvxc3";
        };
      };
    };
    "league/flysystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "league-flysystem-585824702f534f8d3cf7fab7225e8466cc4b7493";
        src = fetchurl {
          url = "https://api.github.com/repos/thephpleague/flysystem/zipball/585824702f534f8d3cf7fab7225e8466cc4b7493";
          sha256 = "0ki59cyllf0zpdr5wnlv7pl9mg683kwy38ahjlvifgvvhy45k1zn";
        };
      };
    };
    "mccool/laravel-auto-presenter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "mccool-laravel-auto-presenter-bbebb533ea6493762cd4cd6ee24b24244c6c0b8e";
        src = fetchurl {
          url = "https://api.github.com/repos/laravel-auto-presenter/laravel-auto-presenter/zipball/bbebb533ea6493762cd4cd6ee24b24244c6c0b8e";
          sha256 = "1pkgxv8h0gsvixfv5k2sif00iz00kag9shjb0krcncix6vhvvacr";
        };
      };
    };
    "monolog/monolog" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "monolog-monolog-2209ddd84e7ef1256b7af205d0717fb62cfc9c33";
        src = fetchurl {
          url = "https://api.github.com/repos/Seldaek/monolog/zipball/2209ddd84e7ef1256b7af205d0717fb62cfc9c33";
          sha256 = "1brvym898mjk6yk95b9lzz35ikj1p17gq7zhr0fj1r1sday8rj4c";
        };
      };
    };
    "mtdowling/jmespath.php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "mtdowling-jmespath.php-42dae2cbd13154083ca6d70099692fef8ca84bfb";
        src = fetchurl {
          url = "https://api.github.com/repos/jmespath/jmespath.php/zipball/42dae2cbd13154083ca6d70099692fef8ca84bfb";
          sha256 = "157pdx45dmkxwxyq8vdjfci24fw7kl3yc2gj1cifp9kaia7mwlkk";
        };
      };
    };
    "nesbot/carbon" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nesbot-carbon-4be0c005164249208ce1b5ca633cd57bdd42ff33";
        src = fetchurl {
          url = "https://api.github.com/repos/briannesbitt/Carbon/zipball/4be0c005164249208ce1b5ca633cd57bdd42ff33";
          sha256 = "15vddmcxpzfaglb0w7y49kahppnl7df0smhwpxgy5v05c5c0093a";
        };
      };
    };
    "nexmo/client" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nexmo-client-c6d11d953c8c5594590bb9ebaba9616e76948f93";
        src = fetchurl {
          url = "https://api.github.com/repos/Nexmo/nexmo-php-complete/zipball/c6d11d953c8c5594590bb9ebaba9616e76948f93";
          sha256 = "1cly90didpwbhligkaj3dzg41186fkz7bssq6kabz3f8k0g5xm96";
        };
      };
    };
    "nexmo/client-core" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nexmo-client-core-182d41a02ebd3e4be147baea45458ccfe2f528c4";
        src = fetchurl {
          url = "https://api.github.com/repos/Nexmo/nexmo-php/zipball/182d41a02ebd3e4be147baea45458ccfe2f528c4";
          sha256 = "1q3s9qvq73f953k4nhzm8sd8g66yas22z2krd4mx5fcfjdmqr8sj";
        };
      };
    };
    "nikic/php-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nikic-php-parser-c6d052fc58cb876152f89f532b95a8d7907e7f0e";
        src = fetchurl {
          url = "https://api.github.com/repos/nikic/PHP-Parser/zipball/c6d052fc58cb876152f89f532b95a8d7907e7f0e";
          sha256 = "1392bj45myazpphic05jxqwlyify72s3qf5vspd991rk5a2p60pw";
        };
      };
    };
    "opis/closure" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "opis-closure-943b5d70cc5ae7483f6aff6ff43d7e34592ca0f5";
        src = fetchurl {
          url = "https://api.github.com/repos/opis/closure/zipball/943b5d70cc5ae7483f6aff6ff43d7e34592ca0f5";
          sha256 = "0y47ldgzzv22c5dnsdzqmbrsicq6acjyba0119d3dc6wa3n7zqi6";
        };
      };
    };
    "paragonie/constant_time_encoding" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "paragonie-constant_time_encoding-f34c2b11eb9d2c9318e13540a1dbc2a3afbd939c";
        src = fetchurl {
          url = "https://api.github.com/repos/paragonie/constant_time_encoding/zipball/f34c2b11eb9d2c9318e13540a1dbc2a3afbd939c";
          sha256 = "1r1xj3j7s5mskw5gh3ars4dfhvcn7d252gdqgpif80026kj5fvrp";
        };
      };
    };
    "php-http/guzzle6-adapter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-http-guzzle6-adapter-a56941f9dc6110409cfcddc91546ee97039277ab";
        src = fetchurl {
          url = "https://api.github.com/repos/php-http/guzzle6-adapter/zipball/a56941f9dc6110409cfcddc91546ee97039277ab";
          sha256 = "1v8rnn6fb8k8cb9v2vncqrim2587hrl4c7jjsmw17mlhzs2sjarl";
        };
      };
    };
    "php-http/httplug" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-http-httplug-1c6381726c18579c4ca2ef1ec1498fdae8bdf018";
        src = fetchurl {
          url = "https://api.github.com/repos/php-http/httplug/zipball/1c6381726c18579c4ca2ef1ec1498fdae8bdf018";
          sha256 = "1rricl1bxallfp2fc2rvk9wmsk8ivnqm2ixdk141p2z51r01kk4j";
        };
      };
    };
    "php-http/promise" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-http-promise-4c4c1f9b7289a2ec57cde7f1e9762a5789506f88";
        src = fetchurl {
          url = "https://api.github.com/repos/php-http/promise/zipball/4c4c1f9b7289a2ec57cde7f1e9762a5789506f88";
          sha256 = "0xjprpx6xlsjr599vrbmf3cb9726adfm1p9q59xcklrh4p8grwbz";
        };
      };
    };
    "pragmarx/google2fa" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "pragmarx-google2fa-17c969c82f427dd916afe4be50bafc6299aef1b4";
        src = fetchurl {
          url = "https://api.github.com/repos/antonioribeiro/google2fa/zipball/17c969c82f427dd916afe4be50bafc6299aef1b4";
          sha256 = "1z6rjqqigw6v2rns2mgjy9y0addqhc05cl19j80z8nw03dschqib";
        };
      };
    };
    "predis/predis" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "predis-predis-9930e933c67446962997b05201c69c2319bf26de";
        src = fetchurl {
          url = "https://api.github.com/repos/predis/predis/zipball/9930e933c67446962997b05201c69c2319bf26de";
          sha256 = "0qnpiyv96gs8yzy3b1ba918yw1pv8bgzw7skcf3k40ffpxsmkxv6";
        };
      };
    };
    "psr/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-container-b7ce3b176482dbbc1245ebf52b181af44c2cf55f";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/container/zipball/b7ce3b176482dbbc1245ebf52b181af44c2cf55f";
          sha256 = "0rkz64vgwb0gfi09klvgay4qnw993l1dc03vyip7d7m2zxi6cy4j";
        };
      };
    };
    "psr/http-factory" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-factory-12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-factory/zipball/12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
          sha256 = "0inbnqpc5bfhbbda9dwazsrw9xscfnc8rdx82q1qm3r446mc1vds";
        };
      };
    };
    "psr/http-message" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-message-f6561bf28d520154e4b0ec72be95418abe6d9363";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-message/zipball/f6561bf28d520154e4b0ec72be95418abe6d9363";
          sha256 = "195dd67hva9bmr52iadr4kyp2gw2f5l51lplfiay2pv6l9y4cf45";
        };
      };
    };
    "psr/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-log-0f73288fd15629204f9d42b7055f72dacbe811fc";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/log/zipball/0f73288fd15629204f9d42b7055f72dacbe811fc";
          sha256 = "1npi9ggl4qll4sdxz1xgp8779ia73gwlpjxbb1f1cpl1wn4s42r4";
        };
      };
    };
    "psr/simple-cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-simple-cache-408d5eafb83c57f6365a3ca330ff23aa4a5fa39b";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/simple-cache/zipball/408d5eafb83c57f6365a3ca330ff23aa4a5fa39b";
          sha256 = "1djgzclkamjxi9jy4m9ggfzgq1vqxaga2ip7l3cj88p7rwkzjxgw";
        };
      };
    };
    "psy/psysh" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psy-psysh-90da7f37568aee36b116a030c5f99c915267edd4";
        src = fetchurl {
          url = "https://api.github.com/repos/bobthecow/psysh/zipball/90da7f37568aee36b116a030c5f99c915267edd4";
          sha256 = "1lffp1xi41sd181f2r5gxb2cbmigypr438k8fawrbllziwdshj74";
        };
      };
    };
    "ralouphie/getallheaders" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "ralouphie-getallheaders-120b605dfeb996808c31b6477290a714d356e822";
        src = fetchurl {
          url = "https://api.github.com/repos/ralouphie/getallheaders/zipball/120b605dfeb996808c31b6477290a714d356e822";
          sha256 = "1bv7ndkkankrqlr2b4kw7qp3fl0dxi6bp26bnim6dnlhavd6a0gg";
        };
      };
    };
    "ramsey/uuid" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "ramsey-uuid-7e1633a6964b48589b142d60542f9ed31bd37a92";
        src = fetchurl {
          url = "https://api.github.com/repos/ramsey/uuid/zipball/7e1633a6964b48589b142d60542f9ed31bd37a92";
          sha256 = "0s6z2c8jvwjmxzy2kqmxqpz0val9i5r757mdwf2yc7qrwm6bwd15";
        };
      };
    };
    "swiftmailer/swiftmailer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "swiftmailer-swiftmailer-698a6a9f54d7eb321274de3ad19863802c879fb7";
        src = fetchurl {
          url = "https://api.github.com/repos/swiftmailer/swiftmailer/zipball/698a6a9f54d7eb321274de3ad19863802c879fb7";
          sha256 = "1zmyr6szxvbc77rs4q1cp7f3vzw1wfx9rbbj7x9s65gh37z9fd1w";
        };
      };
    };
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-12e071278e396cc3e1c149857337e9e192deca0b";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/console/zipball/12e071278e396cc3e1c149857337e9e192deca0b";
          sha256 = "0v49k8mqjs2gywxcx2rk2x211vms9w8pcmk5gwgf74847xzbvc97";
        };
      };
    };
    "symfony/css-selector" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-css-selector-74bd82e75da256ad20851af6ded07823332216c7";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/css-selector/zipball/74bd82e75da256ad20851af6ded07823332216c7";
          sha256 = "038v1z14v6m8jjh0cchzlvfs6z6p4njqiprgsq0y352i11cjaakn";
        };
      };
    };
    "symfony/debug" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-debug-5dfc7825f3bfe9bb74b23d8b8ce0e0894e32b544";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/debug/zipball/5dfc7825f3bfe9bb74b23d8b8ce0e0894e32b544";
          sha256 = "17awfzd2v6w5xca1vf0x8hlz1crzz3pp2g1g42nwy6axygygymdl";
        };
      };
    };
    "symfony/error-handler" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-error-handler-ef2f7ddd3b9177bbf8ff2ecd8d0e970ed48da0c3";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/error-handler/zipball/ef2f7ddd3b9177bbf8ff2ecd8d0e970ed48da0c3";
          sha256 = "19mgkk27lh1vvs19kqfallxzp714dxf7yyyyh6dbkz2j98scq18c";
        };
      };
    };
    "symfony/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-5d4c874b0eb1c32d40328a09dbc37307a5a910b0";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/event-dispatcher/zipball/5d4c874b0eb1c32d40328a09dbc37307a5a910b0";
          sha256 = "1ghfxc3gmshmjfn0w6m5yvl29093b15rx96h14p3sd4vkbs8aj42";
        };
      };
    };
    "symfony/event-dispatcher-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-contracts-84e23fdcd2517bf37aecbd16967e83f0caee25a7";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/event-dispatcher-contracts/zipball/84e23fdcd2517bf37aecbd16967e83f0caee25a7";
          sha256 = "1pcfrlc0rg8vdnp23y3y1p5qzng5nxf5i2c36g9x9f480xrnc1fw";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-ebd0965f2dc2d4e0f11487c16fbb041e50b5c09b";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/finder/zipball/ebd0965f2dc2d4e0f11487c16fbb041e50b5c09b";
          sha256 = "090s0zq2z97xw9nx5rfj57yy1mv0s31h1f1sqjk1af6mbgz7wvsy";
        };
      };
    };
    "symfony/http-client-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-client-contracts-7e86f903f9720d0caa7688f5c29a2de2d77cbb89";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/http-client-contracts/zipball/7e86f903f9720d0caa7688f5c29a2de2d77cbb89";
          sha256 = "0qh4hjdc50b92b4hxb1a8lfb1ry98i430y6xchdj5v91wamfksxq";
        };
      };
    };
    "symfony/http-foundation" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-foundation-5ebda66b51612516bf338d5f87da2f37ff74cf34";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/http-foundation/zipball/5ebda66b51612516bf338d5f87da2f37ff74cf34";
          sha256 = "0g5d6vhj1h1qw8bc31cdasdj6b1n5g18l8j8spdm06h93shq15ck";
        };
      };
    };
    "symfony/http-kernel" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-kernel-eaff9a43e74513508867ecfa66ef94fbb96ab128";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/http-kernel/zipball/eaff9a43e74513508867ecfa66ef94fbb96ab128";
          sha256 = "1wav9r85rbr112nw2z10jzigynllxpkiw93wcbsfk4qwlnn4clnb";
        };
      };
    };
    "symfony/mime" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-mime-7a4176a1cbc4cc99268c531de547fccbd0beb370";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/mime/zipball/7a4176a1cbc4cc99268c531de547fccbd0beb370";
          sha256 = "0l96y27jc3gzzymbg2ns404wn3df6dp127q4lcr3mbx7qia1396s";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-c6c942b1ac76c82448322025e084cadc56048b4e";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-ctype/zipball/c6c942b1ac76c82448322025e084cadc56048b4e";
          sha256 = "0jpk859wx74vm03q5s9z25f4ak2138p2x5q3b587wvy8rq2m4pbd";
        };
      };
    };
    "symfony/polyfill-iconv" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-iconv-b34bfb8c4c22650ac080d2662ae3502e5f2f4ae6";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-iconv/zipball/b34bfb8c4c22650ac080d2662ae3502e5f2f4ae6";
          sha256 = "00lczx358l9n39bi215nmahk0651n9dl5428chz3kdl95rc3l8fm";
        };
      };
    };
    "symfony/polyfill-intl-idn" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-idn-0eb8293dbbcd6ef6bf81404c9ce7d95bcdf34f44";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-idn/zipball/0eb8293dbbcd6ef6bf81404c9ce7d95bcdf34f44";
          sha256 = "0zdhj9bjn9pbdwczfmhklq4q7b46hbmwqgadfxxf0n4cr31l97df";
        };
      };
    };
    "symfony/polyfill-intl-normalizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-normalizer-6e971c891537eb617a00bb07a43d182a6915faba";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-normalizer/zipball/6e971c891537eb617a00bb07a43d182a6915faba";
          sha256 = "05bjbrbl98ap8qrmn22za8303yrpqvnmnk0cr8c4v0jh4kdvck5g";
        };
      };
    };
    "symfony/polyfill-php56" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php56-54b8cd7e6c1643d78d011f3be89f3ef1f9f4c675";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php56/zipball/54b8cd7e6c1643d78d011f3be89f3ef1f9f4c675";
          sha256 = "0gbw33finml181s3gbvamrsav368rysa8fx69fbq0ff9cvn2lmc6";
        };
      };
    };
    "symfony/polyfill-php72" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php72-cc6e6f9b39fe8075b3dabfbaf5b5f645ae1340c9";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php72/zipball/cc6e6f9b39fe8075b3dabfbaf5b5f645ae1340c9";
          sha256 = "12dmz2n1b9pqqd758ja0c8h8h5dxdai5ik74iwvaxc5xn86a026b";
        };
      };
    };
    "symfony/polyfill-php73" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php73-a678b42e92f86eca04b7fa4c0f6f19d097fb69e2";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php73/zipball/a678b42e92f86eca04b7fa4c0f6f19d097fb69e2";
          sha256 = "10rq2x2q9hsdzskrz0aml5qcji27ypxam324044fi24nl60fyzg0";
        };
      };
    };
    "symfony/polyfill-php80" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php80-dc3063ba22c2a1fd2f45ed856374d79114998f91";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php80/zipball/dc3063ba22c2a1fd2f45ed856374d79114998f91";
          sha256 = "1mhfjibk7mqyzlqpz6jjpxpd93fnfw0nik140x3mq1d2blg5cbvd";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-075316ff72233ce3d04a9743414292e834f2cb4a";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/process/zipball/075316ff72233ce3d04a9743414292e834f2cb4a";
          sha256 = "0k5pjs26fbi95vng76qckd142bfwc5yjxcf8x3ck3y22av05b0zd";
        };
      };
    };
    "symfony/routing" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-routing-80b042c20b035818daec844723e23b9825134ba0";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/routing/zipball/80b042c20b035818daec844723e23b9825134ba0";
          sha256 = "0riia3jgxybxd4hzllg55f9z898xxlp2xdigbxgsfdv2iq359vkf";
        };
      };
    };
    "symfony/service-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-service-contracts-b776d18b303a39f56c63747bcb977ad4b27aca26";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/service-contracts/zipball/b776d18b303a39f56c63747bcb977ad4b27aca26";
          sha256 = "1pwwjw1q0sg87za5sa1bk6d9yh8z49wv6nsqm3374vfn1hm9f5wf";
        };
      };
    };
    "symfony/translation" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-translation-c1001b7d75b3136648f94b245588209d881c6939";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/translation/zipball/c1001b7d75b3136648f94b245588209d881c6939";
          sha256 = "18ik4y3rgm94biq70v6yy4qxk3k4bq9j402jpv0pbx215vwakb39";
        };
      };
    };
    "symfony/translation-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-translation-contracts-84180a25fad31e23bebd26ca09d89464f082cacc";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/translation-contracts/zipball/84180a25fad31e23bebd26ca09d89464f082cacc";
          sha256 = "0w8xr3diyjqz1zb5phmla9iii952fjgkzahvr4fl1irhwkjxbmxv";
        };
      };
    };
    "symfony/var-dumper" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-var-dumper-4f31364bbc8177f2a6dbc125ac3851634ebe2a03";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/var-dumper/zipball/4f31364bbc8177f2a6dbc125ac3851634ebe2a03";
          sha256 = "0iilxqkykn0h03mc2n0r988rppzvslqrz3dq3pqcfbhyf1pkpv58";
        };
      };
    };
    "tijsverkoyen/css-to-inline-styles" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "tijsverkoyen-css-to-inline-styles-b43b05cf43c1b6d849478965062b6ef73e223bb5";
        src = fetchurl {
          url = "https://api.github.com/repos/tijsverkoyen/CssToInlineStyles/zipball/b43b05cf43c1b6d849478965062b6ef73e223bb5";
          sha256 = "0lc6jviz8faqxxs453dbqvfdmm6l2iczxla22v2r6xhakl58pf3w";
        };
      };
    };
    "twig/twig" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "twig-twig-57e96259776ddcacf1814885fc3950460c8e18ef";
        src = fetchurl {
          url = "https://api.github.com/repos/twigphp/Twig/zipball/57e96259776ddcacf1814885fc3950460c8e18ef";
          sha256 = "0289d2rn14zy9z3f5cr1gcs342cgycjdvzrhggvgd1ihvycx1fwx";
        };
      };
    };
    "vlucas/phpdotenv" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "vlucas-phpdotenv-b786088918a884258c9e3e27405c6a4cf2ee246e";
        src = fetchurl {
          url = "https://api.github.com/repos/vlucas/phpdotenv/zipball/b786088918a884258c9e3e27405c6a4cf2ee246e";
          sha256 = "0y4aa6jkwj6b74bng3sdvz6hp9gjncr74cj532g7wk54lf1j2ppj";
        };
      };
    };
    "zendframework/zend-diactoros" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-diactoros-de5847b068362a88684a55b0dbb40d85986cfa52";
        src = fetchurl {
          url = "https://api.github.com/repos/zendframework/zend-diactoros/zipball/de5847b068362a88684a55b0dbb40d85986cfa52";
          sha256 = "1na43rs2ak42vjvimajq56zpfwkbnvf3n6wd711vh31r5jvjw1x5";
        };
      };
    };
  };
  devPackages = {
    "alt-three/testbench" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "alt-three-testbench-631bdc18579edce164b88cb940ef3d64f5e3284b";
        src = fetchurl {
          url = "https://api.github.com/repos/fiveai/TestBench/zipball/631bdc18579edce164b88cb940ef3d64f5e3284b";
          sha256 = "07dp9l2899hih7f17yrmx1j0nlvgwijgalf0j4szydsx3maghxga";
        };
      };
    };
    "barryvdh/laravel-debugbar" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "barryvdh-laravel-debugbar-91ee8b3acf0d72a4937f4855bd245acbda9910ac";
        src = fetchurl {
          url = "https://api.github.com/repos/barryvdh/laravel-debugbar/zipball/91ee8b3acf0d72a4937f4855bd245acbda9910ac";
          sha256 = "09xdb3x4bq1c2694npndlnkzazhaljw536z44565hqms6q0rg3bx";
        };
      };
    };
    "doctrine/instantiator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-instantiator-d56bf6102915de5702778fe20f2de3b2fe570b5b";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/instantiator/zipball/d56bf6102915de5702778fe20f2de3b2fe570b5b";
          sha256 = "04rihgfjv8alvvb92bnb5qpz8fvqvjwfrawcjw34pfnfx4jflcwh";
        };
      };
    };
    "filp/whoops" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "filp-whoops-307fb34a5ab697461ec4c9db865b20ff2fd40771";
        src = fetchurl {
          url = "https://api.github.com/repos/filp/whoops/zipball/307fb34a5ab697461ec4c9db865b20ff2fd40771";
          sha256 = "0fgj0gcnagm8g3dml9628gq8bd2jkcq11bx5ndxpkzngq60b1d82";
        };
      };
    };
    "fzaninotto/faker" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "fzaninotto-faker-848d8125239d7dbf8ab25cb7f054f1a630e68c2e";
        src = fetchurl {
          url = "https://api.github.com/repos/fzaninotto/Faker/zipball/848d8125239d7dbf8ab25cb7f054f1a630e68c2e";
          sha256 = "1nsbmkws5lwfm0nhy67q6awzwcb1qxgnqml6yfy3wfj7s62r6x09";
        };
      };
    };
    "graham-campbell/analyzer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-analyzer-baecd15b7e1185075a8db63ca1806c555cd60bc8";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Analyzer/zipball/baecd15b7e1185075a8db63ca1806c555cd60bc8";
          sha256 = "0mbn4lhfprfglf249p9lanpy6z9638mr9mb3k07ksq050gyrjvyv";
        };
      };
    };
    "graham-campbell/testbench-core" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graham-campbell-testbench-core-6323e0305fea8488c75de223251941f1f966f4ec";
        src = fetchurl {
          url = "https://api.github.com/repos/GrahamCampbell/Laravel-TestBench-Core/zipball/6323e0305fea8488c75de223251941f1f966f4ec";
          sha256 = "199g5s00j2ds0g957aqr6j4q68sxgpax4smzpy8wwwpg68isixsi";
        };
      };
    };
    "hamcrest/hamcrest-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "hamcrest-hamcrest-php-8c3d0a3f6af734494ad8f6fbbee0ba92422859f3";
        src = fetchurl {
          url = "https://api.github.com/repos/hamcrest/hamcrest-php/zipball/8c3d0a3f6af734494ad8f6fbbee0ba92422859f3";
          sha256 = "1ixmmpplaf1z36f34d9f1342qjbcizvi5ddkjdli6jgrbla6a6hr";
        };
      };
    };
    "maximebf/debugbar" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "maximebf-debugbar-6d51ee9e94cff14412783785e79a4e7ef97b9d62";
        src = fetchurl {
          url = "https://api.github.com/repos/maximebf/php-debugbar/zipball/6d51ee9e94cff14412783785e79a4e7ef97b9d62";
          sha256 = "13lh63wnsp2a6564h3if3925x4maf2plkhzyd1byv995g7bhi68i";
        };
      };
    };
    "mockery/mockery" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "mockery-mockery-60fa2f67f6e4d3634bb4a45ff3171fa52215800d";
        src = fetchurl {
          url = "https://api.github.com/repos/mockery/mockery/zipball/60fa2f67f6e4d3634bb4a45ff3171fa52215800d";
          sha256 = "1318y7jgssxkbfs03v0nw8kvpqi5787jpj0ybn89anmaz67fk3hm";
        };
      };
    };
    "myclabs/deep-copy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "myclabs-deep-copy-776f831124e9c62e1a2c601ecc52e776d8bb7220";
        src = fetchurl {
          url = "https://api.github.com/repos/myclabs/DeepCopy/zipball/776f831124e9c62e1a2c601ecc52e776d8bb7220";
          sha256 = "181f3fsxs6s2wyy4y7qfk08qmlbvz1wn3mn3lqy42grsb8g8ym0k";
        };
      };
    };
    "phar-io/manifest" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phar-io-manifest-7761fcacf03b4d4f16e7ccb606d4879ca431fcf4";
        src = fetchurl {
          url = "https://api.github.com/repos/phar-io/manifest/zipball/7761fcacf03b4d4f16e7ccb606d4879ca431fcf4";
          sha256 = "1n59a0gnk43ryl54bc37hlsi1spvi8280bq64zddxrpagyjyp15a";
        };
      };
    };
    "phar-io/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phar-io-version-45a2ec53a73c70ce41d55cedef9063630abaf1b6";
        src = fetchurl {
          url = "https://api.github.com/repos/phar-io/version/zipball/45a2ec53a73c70ce41d55cedef9063630abaf1b6";
          sha256 = "0syr7v2b3lsdavfa22z55sdkg5awc3jlzpgn0qk0d3vf6x96hvzp";
        };
      };
    };
    "phpdocumentor/reflection-common" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-common-6568f4687e5b41b054365f9ae03fcb1ed5f2069b";
        src = fetchurl {
          url = "https://api.github.com/repos/phpDocumentor/ReflectionCommon/zipball/6568f4687e5b41b054365f9ae03fcb1ed5f2069b";
          sha256 = "03ni3h86vg97wvnqj0nix79mza1krar0vghwa8fcd0h5lxx73smy";
        };
      };
    };
    "phpdocumentor/reflection-docblock" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-docblock-da3fd972d6bafd628114f7e7e036f45944b62e9c";
        src = fetchurl {
          url = "https://api.github.com/repos/phpDocumentor/ReflectionDocBlock/zipball/da3fd972d6bafd628114f7e7e036f45944b62e9c";
          sha256 = "1kkhlsg34flnmibcz5rxrraj3xyyf4j2v0ayz4wf5iix2vhk1wk2";
        };
      };
    };
    "phpdocumentor/type-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-type-resolver-2e32a6d48972b2c1976ed5d8967145b6cec4a4a9";
        src = fetchurl {
          url = "https://api.github.com/repos/phpDocumentor/TypeResolver/zipball/2e32a6d48972b2c1976ed5d8967145b6cec4a4a9";
          sha256 = "17iywfpk7nf2lasb94fcbyi0fjs30fp49mqii2s8bjdwqc7gp8j4";
        };
      };
    };
    "phpspec/prophecy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpspec-prophecy-451c3cd1418cf640de218914901e51b064abb093";
        src = fetchurl {
          url = "https://api.github.com/repos/phpspec/prophecy/zipball/451c3cd1418cf640de218914901e51b064abb093";
          sha256 = "0z6wh1lygafcfw36r9abrg7fgq9r3v1233v38g4wbqy3jf7xfrzb";
        };
      };
    };
    "phpunit/php-code-coverage" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-code-coverage-807e6013b00af69b6c5d9ceb4282d0393dbb9d8d";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-code-coverage/zipball/807e6013b00af69b6c5d9ceb4282d0393dbb9d8d";
          sha256 = "04l5piavahvxp5j3f6s1cx85b3lnjidnlw3nixk24nwqx4bdfk10";
        };
      };
    };
    "phpunit/php-file-iterator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-file-iterator-4b49fb70f067272b659ef0174ff9ca40fdaa6357";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-file-iterator/zipball/4b49fb70f067272b659ef0174ff9ca40fdaa6357";
          sha256 = "1f0libqg4r5miijs8jaimn11skcxw095ypbhxfvjcxndcv6r9c1s";
        };
      };
    };
    "phpunit/php-text-template" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-text-template-31f8b717e51d9a2afca6c9f046f5d69fc27c8686";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-text-template/zipball/31f8b717e51d9a2afca6c9f046f5d69fc27c8686";
          sha256 = "1y03m38qqvsbvyakd72v4dram81dw3swyn5jpss153i5nmqr4p76";
        };
      };
    };
    "phpunit/php-timer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-timer-2454ae1765516d20c4ffe103d85a58a9a3bd5662";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-timer/zipball/2454ae1765516d20c4ffe103d85a58a9a3bd5662";
          sha256 = "12gaqzvgh5y212zmp253z03w0f040v00zqafymilzkc9l0m2fsxd";
        };
      };
    };
    "phpunit/php-token-stream" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-token-stream-472b687829041c24b25f475e14c2f38a09edf1c2";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-token-stream/zipball/472b687829041c24b25f475e14c2f38a09edf1c2";
          sha256 = "0jgy1pr1qq1y378nmz2rjwpb8640gri2827qw9060q78sl3wvfpz";
        };
      };
    };
    "phpunit/phpunit" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-phpunit-9467db479d1b0487c99733bb1e7944d32deded2c";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/phpunit/zipball/9467db479d1b0487c99733bb1e7944d32deded2c";
          sha256 = "192mri9ikbcc8ix4pwiwyyw8jc9xfg77il4wjbadycw4k4f43944";
        };
      };
    };
    "sebastian/code-unit-reverse-lookup" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-code-unit-reverse-lookup-1de8cd5c010cb153fcd68b8d0f64606f523f7619";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/code-unit-reverse-lookup/zipball/1de8cd5c010cb153fcd68b8d0f64606f523f7619";
          sha256 = "17690sqmhdabhvgalrf2ypbx4nll4g4cwdbi51w5p6w9n8cxch1a";
        };
      };
    };
    "sebastian/comparator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-comparator-1071dfcef776a57013124ff35e1fc41ccd294758";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/comparator/zipball/1071dfcef776a57013124ff35e1fc41ccd294758";
          sha256 = "0i2lnvf56n4s88001dzxzy9bjzih1qbf7kzc7457qhlvwdnaydn3";
        };
      };
    };
    "sebastian/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-diff-14f72dd46eaf2f2293cbe79c93cc0bc43161a211";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/diff/zipball/14f72dd46eaf2f2293cbe79c93cc0bc43161a211";
          sha256 = "0planffhifwhxgml9r3ma89c83jvbrqilj517a5ps9x8vc6kk312";
        };
      };
    };
    "sebastian/environment" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-environment-d47bbbad83711771f167c72d4e3f25f7fcc1f8b0";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/environment/zipball/d47bbbad83711771f167c72d4e3f25f7fcc1f8b0";
          sha256 = "1s5wfp79bx2diw9jxfdm6l54286pr9b1rhs7s2j71rvj4y7pycgp";
        };
      };
    };
    "sebastian/exporter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-exporter-6b853149eab67d4da22291d36f5b0631c0fd856e";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/exporter/zipball/6b853149eab67d4da22291d36f5b0631c0fd856e";
          sha256 = "1s0n1vbds3yj8mg98vmykxz61mgsbqd28bv63cw8fkvnmgb0s5x7";
        };
      };
    };
    "sebastian/global-state" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-global-state-e8ba02eed7bbbb9e59e43dedd3dddeff4a56b0c4";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/global-state/zipball/e8ba02eed7bbbb9e59e43dedd3dddeff4a56b0c4";
          sha256 = "1489kfvz0gg6jprakr43mjkminlhpsimcdrrxkmsm6mmhahbgjnf";
        };
      };
    };
    "sebastian/object-enumerator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-enumerator-e67f6d32ebd0c749cf9d1dbd9f226c727043cdf2";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/object-enumerator/zipball/e67f6d32ebd0c749cf9d1dbd9f226c727043cdf2";
          sha256 = "10g778j02h3kywvz4ldhin64zbypxpl0l39rm2ycsr7iin8q904w";
        };
      };
    };
    "sebastian/object-reflector" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-reflector-9b8772b9cbd456ab45d4a598d2dd1a1bced6363d";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/object-reflector/zipball/9b8772b9cbd456ab45d4a598d2dd1a1bced6363d";
          sha256 = "010g9mkf3s1hcbwn1wvd9s72xcyjzrb6csx472xs69yln1mr11z8";
        };
      };
    };
    "sebastian/recursion-context" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-recursion-context-367dcba38d6e1977be014dc4b22f47a484dac7fb";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/recursion-context/zipball/367dcba38d6e1977be014dc4b22f47a484dac7fb";
          sha256 = "1zpq0qk2mgwnbyhjnj05dz2n2v8hvj2g4jy68fd5klxxkdr92ps7";
        };
      };
    };
    "sebastian/resource-operations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-resource-operations-31d35ca87926450c44eae7e2611d45a7a65ea8b3";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/resource-operations/zipball/31d35ca87926450c44eae7e2611d45a7a65ea8b3";
          sha256 = "10im8r899k4jdch1r4n6nbfvxbqnndg3bqrzlvxi03w501pcsxfd";
        };
      };
    };
    "sebastian/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-version-99732be0ddb3361e16ad77b68ba41efc8e979019";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/version/zipball/99732be0ddb3361e16ad77b68ba41efc8e979019";
          sha256 = "0wrw5hskz2hg5aph9r1fhnngfrcvhws1pgs0lfrwindy066z6fj7";
        };
      };
    };
    "theseer/tokenizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "theseer-tokenizer-11336f6f84e16a720dae9d8e6ed5019efa85a0f9";
        src = fetchurl {
          url = "https://api.github.com/repos/theseer/tokenizer/zipball/11336f6f84e16a720dae9d8e6ed5019efa85a0f9";
          sha256 = "1nnym5d45fanxfp18yb0ylpwcvg3973ppzc67ana02g9w72gfspl";
        };
      };
    };
    "tightenco/mailthief" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "tightenco-mailthief-9a8c2443be2b3d77753596f70ae6cd879b5b26a6";
        src = fetchurl {
          url = "https://api.github.com/repos/tighten/mailthief/zipball/9a8c2443be2b3d77753596f70ae6cd879b5b26a6";
          sha256 = "1kpg2bsacrgsad0lpqz1mf8wgdi5fnjgyxpi09w9bpszmhnnqgrj";
        };
      };
    };
    "webmozart/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-assert-bafc69caeb4d49c39fd0779086c03a3738cbb389";
        src = fetchurl {
          url = "https://api.github.com/repos/webmozarts/assert/zipball/bafc69caeb4d49c39fd0779086c03a3738cbb389";
          sha256 = "0wd0si4c9r1256xj76vgk2slxpamd0wzam3dyyz0g8xgyra7201c";
        };
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev src;
  name = "cachethq-cachet";
  executable = false;
  symlinkDependencies = false;
  meta = {
    license = "BSD-3-Clause";
  };
}
