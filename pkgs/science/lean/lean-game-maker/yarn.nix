{ fetchurl, fetchgit, linkFarm, runCommandNoCC, gnutar }: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
    {
      name = "_babel_code_frame___code_frame_7.8.3.tgz";
      path = fetchurl {
        name = "_babel_code_frame___code_frame_7.8.3.tgz";
        url  = "https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.8.3.tgz";
        sha1 = "33e25903d7481181534e12ec0a25f16b6fcf419e";
      };
    }
    {
      name = "_babel_helper_validator_identifier___helper_validator_identifier_7.9.5.tgz";
      path = fetchurl {
        name = "_babel_helper_validator_identifier___helper_validator_identifier_7.9.5.tgz";
        url  = "https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.9.5.tgz";
        sha1 = "90977a8e6fbf6b431a7dc31752eee233bf052d80";
      };
    }
    {
      name = "_babel_highlight___highlight_7.9.0.tgz";
      path = fetchurl {
        name = "_babel_highlight___highlight_7.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.9.0.tgz";
        sha1 = "4e9b45ccb82b79607271b2979ad82c7b68163079";
      };
    }
    {
      name = "_bryangingechen_lean_client_js_browser___lean_client_js_browser_1.4.0.tgz";
      path = fetchurl {
        name = "_bryangingechen_lean_client_js_browser___lean_client_js_browser_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/@bryangingechen/lean-client-js-browser/-/lean-client-js-browser-1.4.0.tgz";
        sha1 = "b78637855456c300d4fdca74a554c9d47e3787ea";
      };
    }
    {
      name = "_tweenjs_tween.js___tween.js_18.5.0.tgz";
      path = fetchurl {
        name = "_tweenjs_tween.js___tween.js_18.5.0.tgz";
        url  = "https://registry.yarnpkg.com/@tweenjs/tween.js/-/tween.js-18.5.0.tgz";
        sha1 = "f2aa9e6052c6a314d85c9a8034146f9ae6d4e339";
      };
    }
    {
      name = "_types_dropboxjs___dropboxjs_0.0.29.tgz";
      path = fetchurl {
        name = "_types_dropboxjs___dropboxjs_0.0.29.tgz";
        url  = "https://registry.yarnpkg.com/@types/dropboxjs/-/dropboxjs-0.0.29.tgz";
        sha1 = "056637c5be17b8fd29222e4b6463e29b328b5156";
      };
    }
    {
      name = "_types_filesystem___filesystem_0.0.28.tgz";
      path = fetchurl {
        name = "_types_filesystem___filesystem_0.0.28.tgz";
        url  = "https://registry.yarnpkg.com/@types/filesystem/-/filesystem-0.0.28.tgz";
        sha1 = "3fd7735830f2c7413cb5ac45780bc45904697b0e";
      };
    }
    {
      name = "_types_filewriter___filewriter_0.0.28.tgz";
      path = fetchurl {
        name = "_types_filewriter___filewriter_0.0.28.tgz";
        url  = "https://registry.yarnpkg.com/@types/filewriter/-/filewriter-0.0.28.tgz";
        sha1 = "c054e8af4d9dd75db4e63abc76f885168714d4b3";
      };
    }
    {
      name = "_types_node___node_8.0.19.tgz";
      path = fetchurl {
        name = "_types_node___node_8.0.19.tgz";
        url  = "https://registry.yarnpkg.com/@types/node/-/node-8.0.19.tgz";
        sha1 = "e46e2b0243de7d03f15b26b45c59ebb84f657a4e";
      };
    }
    {
      name = "_types_node___node_12.12.36.tgz";
      path = fetchurl {
        name = "_types_node___node_12.12.36.tgz";
        url  = "https://registry.yarnpkg.com/@types/node/-/node-12.12.36.tgz";
        sha1 = "162c8c2a2e659da480049df0e19ae128ad3a1527";
      };
    }
    {
      name = "_types_node___node_9.6.56.tgz";
      path = fetchurl {
        name = "_types_node___node_9.6.56.tgz";
        url  = "https://registry.yarnpkg.com/@types/node/-/node-9.6.56.tgz";
        sha1 = "036f665320d2f04bd62c0cd83222254a6a3b4437";
      };
    }
    {
      name = "_types_prop_types___prop_types_15.7.3.tgz";
      path = fetchurl {
        name = "_types_prop_types___prop_types_15.7.3.tgz";
        url  = "https://registry.yarnpkg.com/@types/prop-types/-/prop-types-15.7.3.tgz";
        sha1 = "2ab0d5da2e5815f94b0b9d4b95d1e5f243ab2ca7";
      };
    }
    {
      name = "_types_react_dom___react_dom_16.9.6.tgz";
      path = fetchurl {
        name = "_types_react_dom___react_dom_16.9.6.tgz";
        url  = "https://registry.yarnpkg.com/@types/react-dom/-/react-dom-16.9.6.tgz";
        sha1 = "9e7f83d90566521cc2083be2277c6712dcaf754c";
      };
    }
    {
      name = "_types_react___react_16.9.34.tgz";
      path = fetchurl {
        name = "_types_react___react_16.9.34.tgz";
        url  = "https://registry.yarnpkg.com/@types/react/-/react-16.9.34.tgz";
        sha1 = "f7d5e331c468f53affed17a8a4d488cd44ea9349";
      };
    }
    {
      name = "_webassemblyjs_ast___ast_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_ast___ast_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.9.0.tgz";
        sha1 = "bd850604b4042459a5a41cd7d338cbed695ed964";
      };
    }
    {
      name = "_webassemblyjs_floating_point_hex_parser___floating_point_hex_parser_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_floating_point_hex_parser___floating_point_hex_parser_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz";
        sha1 = "3c3d3b271bddfc84deb00f71344438311d52ffb4";
      };
    }
    {
      name = "_webassemblyjs_helper_api_error___helper_api_error_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_api_error___helper_api_error_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz";
        sha1 = "203f676e333b96c9da2eeab3ccef33c45928b6a2";
      };
    }
    {
      name = "_webassemblyjs_helper_buffer___helper_buffer_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_buffer___helper_buffer_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz";
        sha1 = "a1442d269c5feb23fcbc9ef759dac3547f29de00";
      };
    }
    {
      name = "_webassemblyjs_helper_code_frame___helper_code_frame_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_code_frame___helper_code_frame_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz";
        sha1 = "647f8892cd2043a82ac0c8c5e75c36f1d9159f27";
      };
    }
    {
      name = "_webassemblyjs_helper_fsm___helper_fsm_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_fsm___helper_fsm_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz";
        sha1 = "c05256b71244214671f4b08ec108ad63b70eddb8";
      };
    }
    {
      name = "_webassemblyjs_helper_module_context___helper_module_context_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_module_context___helper_module_context_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz";
        sha1 = "25d8884b76839871a08a6c6f806c3979ef712f07";
      };
    }
    {
      name = "_webassemblyjs_helper_wasm_bytecode___helper_wasm_bytecode_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_wasm_bytecode___helper_wasm_bytecode_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz";
        sha1 = "4fed8beac9b8c14f8c58b70d124d549dd1fe5790";
      };
    }
    {
      name = "_webassemblyjs_helper_wasm_section___helper_wasm_section_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_helper_wasm_section___helper_wasm_section_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz";
        sha1 = "5a4138d5a6292ba18b04c5ae49717e4167965346";
      };
    }
    {
      name = "_webassemblyjs_ieee754___ieee754_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_ieee754___ieee754_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz";
        sha1 = "15c7a0fbaae83fb26143bbacf6d6df1702ad39e4";
      };
    }
    {
      name = "_webassemblyjs_leb128___leb128_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_leb128___leb128_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.9.0.tgz";
        sha1 = "f19ca0b76a6dc55623a09cffa769e838fa1e1c95";
      };
    }
    {
      name = "_webassemblyjs_utf8___utf8_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_utf8___utf8_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.9.0.tgz";
        sha1 = "04d33b636f78e6a6813227e82402f7637b6229ab";
      };
    }
    {
      name = "_webassemblyjs_wasm_edit___wasm_edit_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_wasm_edit___wasm_edit_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz";
        sha1 = "3fe6d79d3f0f922183aa86002c42dd256cfee9cf";
      };
    }
    {
      name = "_webassemblyjs_wasm_gen___wasm_gen_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_wasm_gen___wasm_gen_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz";
        sha1 = "50bc70ec68ded8e2763b01a1418bf43491a7a49c";
      };
    }
    {
      name = "_webassemblyjs_wasm_opt___wasm_opt_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_wasm_opt___wasm_opt_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz";
        sha1 = "2211181e5b31326443cc8112eb9f0b9028721a61";
      };
    }
    {
      name = "_webassemblyjs_wasm_parser___wasm_parser_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_wasm_parser___wasm_parser_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz";
        sha1 = "9d48e44826df4a6598294aa6c87469d642fff65e";
      };
    }
    {
      name = "_webassemblyjs_wast_parser___wast_parser_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_wast_parser___wast_parser_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz";
        sha1 = "3031115d79ac5bd261556cecc3fa90a3ef451914";
      };
    }
    {
      name = "_webassemblyjs_wast_printer___wast_printer_1.9.0.tgz";
      path = fetchurl {
        name = "_webassemblyjs_wast_printer___wast_printer_1.9.0.tgz";
        url  = "https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz";
        sha1 = "4935d54c85fef637b00ce9f52377451d00d47899";
      };
    }
    {
      name = "_xtuc_ieee754___ieee754_1.2.0.tgz";
      path = fetchurl {
        name = "_xtuc_ieee754___ieee754_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz";
        sha1 = "eef014a3145ae477a1cbc00cd1e552336dceb790";
      };
    }
    {
      name = "_xtuc_long___long_4.2.2.tgz";
      path = fetchurl {
        name = "_xtuc_long___long_4.2.2.tgz";
        url  = "https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz";
        sha1 = "d291c6a4e97989b5c61d9acf396ae4fe133a718d";
      };
    }
    {
      name = "abbrev___abbrev_1.1.1.tgz";
      path = fetchurl {
        name = "abbrev___abbrev_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz";
        sha1 = "f8f2c887ad10bf67f634f005b6987fed3179aac8";
      };
    }
    {
      name = "accessor_fn___accessor_fn_1.3.0.tgz";
      path = fetchurl {
        name = "accessor_fn___accessor_fn_1.3.0.tgz";
        url  = "https://registry.yarnpkg.com/accessor-fn/-/accessor-fn-1.3.0.tgz";
        sha1 = "52cfc21ff5633a12177f757ec1e4c4fbb361bb02";
      };
    }
    {
      name = "acorn___acorn_6.4.1.tgz";
      path = fetchurl {
        name = "acorn___acorn_6.4.1.tgz";
        url  = "https://registry.yarnpkg.com/acorn/-/acorn-6.4.1.tgz";
        sha1 = "531e58ba3f51b9dacb9a6646ca4debf5b14ca474";
      };
    }
    {
      name = "aggregate_error___aggregate_error_3.0.1.tgz";
      path = fetchurl {
        name = "aggregate_error___aggregate_error_3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.0.1.tgz";
        sha1 = "db2fe7246e536f40d9b5442a39e117d7dd6a24e0";
      };
    }
    {
      name = "ajv_errors___ajv_errors_1.0.1.tgz";
      path = fetchurl {
        name = "ajv_errors___ajv_errors_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/ajv-errors/-/ajv-errors-1.0.1.tgz";
        sha1 = "f35986aceb91afadec4102fbd85014950cefa64d";
      };
    }
    {
      name = "ajv_keywords___ajv_keywords_3.4.1.tgz";
      path = fetchurl {
        name = "ajv_keywords___ajv_keywords_3.4.1.tgz";
        url  = "https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.4.1.tgz";
        sha1 = "ef916e271c64ac12171fd8384eaae6b2345854da";
      };
    }
    {
      name = "ajv___ajv_6.12.1.tgz";
      path = fetchurl {
        name = "ajv___ajv_6.12.1.tgz";
        url  = "https://registry.yarnpkg.com/ajv/-/ajv-6.12.1.tgz";
        sha1 = "cce4d7dfcd62d3c57b1cd772e688eff5f5cd3839";
      };
    }
    {
      name = "ansi_colors___ansi_colors_3.2.4.tgz";
      path = fetchurl {
        name = "ansi_colors___ansi_colors_3.2.4.tgz";
        url  = "https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-3.2.4.tgz";
        sha1 = "e3a3da4bfbae6c86a9c285625de124a234026fbf";
      };
    }
    {
      name = "ansi_regex___ansi_regex_2.1.1.tgz";
      path = fetchurl {
        name = "ansi_regex___ansi_regex_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz";
        sha1 = "c3b33ab5ee360d86e0e628f0468ae7ef27d654df";
      };
    }
    {
      name = "ansi_regex___ansi_regex_4.1.0.tgz";
      path = fetchurl {
        name = "ansi_regex___ansi_regex_4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-4.1.0.tgz";
        sha1 = "8b9f8f08cf1acb843756a839ca8c7e3168c51997";
      };
    }
    {
      name = "ansi_styles___ansi_styles_3.2.1.tgz";
      path = fetchurl {
        name = "ansi_styles___ansi_styles_3.2.1.tgz";
        url  = "https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz";
        sha1 = "41fbb20243e50b12be0f04b8dedbf07520ce841d";
      };
    }
    {
      name = "anymatch___anymatch_2.0.0.tgz";
      path = fetchurl {
        name = "anymatch___anymatch_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/anymatch/-/anymatch-2.0.0.tgz";
        sha1 = "bcb24b4f37934d9aa7ac17b4adaf89e7c76ef2eb";
      };
    }
    {
      name = "aproba___aproba_1.2.0.tgz";
      path = fetchurl {
        name = "aproba___aproba_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz";
        sha1 = "6802e6264efd18c790a1b0d517f0f2627bf2c94a";
      };
    }
    {
      name = "are_we_there_yet___are_we_there_yet_1.1.5.tgz";
      path = fetchurl {
        name = "are_we_there_yet___are_we_there_yet_1.1.5.tgz";
        url  = "https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.5.tgz";
        sha1 = "4b35c2944f062a8bfcda66410760350fe9ddfc21";
      };
    }
    {
      name = "argparse___argparse_1.0.10.tgz";
      path = fetchurl {
        name = "argparse___argparse_1.0.10.tgz";
        url  = "https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz";
        sha1 = "bcd6791ea5ae09725e17e5ad988134cd40b3d911";
      };
    }
    {
      name = "arr_diff___arr_diff_4.0.0.tgz";
      path = fetchurl {
        name = "arr_diff___arr_diff_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/arr-diff/-/arr-diff-4.0.0.tgz";
        sha1 = "d6461074febfec71e7e15235761a329a5dc7c520";
      };
    }
    {
      name = "arr_flatten___arr_flatten_1.1.0.tgz";
      path = fetchurl {
        name = "arr_flatten___arr_flatten_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/arr-flatten/-/arr-flatten-1.1.0.tgz";
        sha1 = "36048bbff4e7b47e136644316c99669ea5ae91f1";
      };
    }
    {
      name = "arr_union___arr_union_3.1.0.tgz";
      path = fetchurl {
        name = "arr_union___arr_union_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/arr-union/-/arr-union-3.1.0.tgz";
        sha1 = "e39b09aea9def866a8f206e288af63919bae39c4";
      };
    }
    {
      name = "array_union___array_union_1.0.2.tgz";
      path = fetchurl {
        name = "array_union___array_union_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/array-union/-/array-union-1.0.2.tgz";
        sha1 = "9a34410e4f4e3da23dea375be5be70f24778ec39";
      };
    }
    {
      name = "array_uniq___array_uniq_1.0.3.tgz";
      path = fetchurl {
        name = "array_uniq___array_uniq_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/array-uniq/-/array-uniq-1.0.3.tgz";
        sha1 = "af6ac877a25cc7f74e058894753858dfdb24fdb6";
      };
    }
    {
      name = "array_unique___array_unique_0.3.2.tgz";
      path = fetchurl {
        name = "array_unique___array_unique_0.3.2.tgz";
        url  = "https://registry.yarnpkg.com/array-unique/-/array-unique-0.3.2.tgz";
        sha1 = "a894b75d4bc4f6cd679ef3244a9fd8f46ae2d428";
      };
    }
    {
      name = "asn1.js___asn1.js_4.10.1.tgz";
      path = fetchurl {
        name = "asn1.js___asn1.js_4.10.1.tgz";
        url  = "https://registry.yarnpkg.com/asn1.js/-/asn1.js-4.10.1.tgz";
        sha1 = "b9c2bf5805f1e64aadeed6df3a2bfafb5a73f5a0";
      };
    }
    {
      name = "assert___assert_1.5.0.tgz";
      path = fetchurl {
        name = "assert___assert_1.5.0.tgz";
        url  = "https://registry.yarnpkg.com/assert/-/assert-1.5.0.tgz";
        sha1 = "55c109aaf6e0aefdb3dc4b71240c70bf574b18eb";
      };
    }
    {
      name = "assign_symbols___assign_symbols_1.0.0.tgz";
      path = fetchurl {
        name = "assign_symbols___assign_symbols_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/assign-symbols/-/assign-symbols-1.0.0.tgz";
        sha1 = "59667f41fadd4f20ccbc2bb96b8d4f7f78ec0367";
      };
    }
    {
      name = "async_each___async_each_1.0.3.tgz";
      path = fetchurl {
        name = "async_each___async_each_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/async-each/-/async-each-1.0.3.tgz";
        sha1 = "b727dbf87d7651602f06f4d4ac387f47d91b0cbf";
      };
    }
    {
      name = "async___async_2.6.3.tgz";
      path = fetchurl {
        name = "async___async_2.6.3.tgz";
        url  = "https://registry.yarnpkg.com/async/-/async-2.6.3.tgz";
        sha1 = "d72625e2344a3656e3a3ad4fa749fa83299d82ff";
      };
    }
    {
      name = "atob___atob_2.1.2.tgz";
      path = fetchurl {
        name = "atob___atob_2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/atob/-/atob-2.1.2.tgz";
        sha1 = "6d9517eb9e030d2436666651e86bd9f6f13533c9";
      };
    }
    {
      name = "balanced_match___balanced_match_1.0.0.tgz";
      path = fetchurl {
        name = "balanced_match___balanced_match_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.0.tgz";
        sha1 = "89b4d199ab2bee49de164ea02b89ce462d71b767";
      };
    }
    {
      name = "base64_js___base64_js_1.3.1.tgz";
      path = fetchurl {
        name = "base64_js___base64_js_1.3.1.tgz";
        url  = "https://registry.yarnpkg.com/base64-js/-/base64-js-1.3.1.tgz";
        sha1 = "58ece8cb75dd07e71ed08c736abc5fac4dbf8df1";
      };
    }
    {
      name = "base___base_0.11.2.tgz";
      path = fetchurl {
        name = "base___base_0.11.2.tgz";
        url  = "https://registry.yarnpkg.com/base/-/base-0.11.2.tgz";
        sha1 = "7bde5ced145b6d551a90db87f83c558b4eb48a8f";
      };
    }
    {
      name = "bezier_js___bezier_js_2.6.1.tgz";
      path = fetchurl {
        name = "bezier_js___bezier_js_2.6.1.tgz";
        url  = "https://registry.yarnpkg.com/bezier-js/-/bezier-js-2.6.1.tgz";
        sha1 = "ed9c6ebfcb3214794ff213cf90ee8aac644ecf7f";
      };
    }
    {
      name = "big.js___big.js_3.2.0.tgz";
      path = fetchurl {
        name = "big.js___big.js_3.2.0.tgz";
        url  = "https://registry.yarnpkg.com/big.js/-/big.js-3.2.0.tgz";
        sha1 = "a5fc298b81b9e0dca2e458824784b65c52ba588e";
      };
    }
    {
      name = "big.js___big.js_5.2.2.tgz";
      path = fetchurl {
        name = "big.js___big.js_5.2.2.tgz";
        url  = "https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz";
        sha1 = "65f0af382f578bcdc742bd9c281e9cb2d7768328";
      };
    }
    {
      name = "binary_extensions___binary_extensions_1.13.1.tgz";
      path = fetchurl {
        name = "binary_extensions___binary_extensions_1.13.1.tgz";
        url  = "https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-1.13.1.tgz";
        sha1 = "598afe54755b2868a5330d2aff9d4ebb53209b65";
      };
    }
    {
      name = "bindings___bindings_1.5.0.tgz";
      path = fetchurl {
        name = "bindings___bindings_1.5.0.tgz";
        url  = "https://registry.yarnpkg.com/bindings/-/bindings-1.5.0.tgz";
        sha1 = "10353c9e945334bc0511a6d90b38fbc7c9c504df";
      };
    }
    {
      name = "bluebird___bluebird_3.7.2.tgz";
      path = fetchurl {
        name = "bluebird___bluebird_3.7.2.tgz";
        url  = "https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz";
        sha1 = "9f229c15be272454ffa973ace0dbee79a1b0c36f";
      };
    }
    {
      name = "bn.js___bn.js_4.11.8.tgz";
      path = fetchurl {
        name = "bn.js___bn.js_4.11.8.tgz";
        url  = "https://registry.yarnpkg.com/bn.js/-/bn.js-4.11.8.tgz";
        sha1 = "2cde09eb5ee341f484746bb0309b3253b1b1442f";
      };
    }
    {
      name = "boolbase___boolbase_1.0.0.tgz";
      path = fetchurl {
        name = "boolbase___boolbase_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/boolbase/-/boolbase-1.0.0.tgz";
        sha1 = "68dff5fbe60c51eb37725ea9e3ed310dcc1e776e";
      };
    }
    {
      name = "brace_expansion___brace_expansion_1.1.11.tgz";
      path = fetchurl {
        name = "brace_expansion___brace_expansion_1.1.11.tgz";
        url  = "https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha1 = "3c7fcbf529d87226f3d2f52b966ff5271eb441dd";
      };
    }
    {
      name = "braces___braces_2.3.2.tgz";
      path = fetchurl {
        name = "braces___braces_2.3.2.tgz";
        url  = "https://registry.yarnpkg.com/braces/-/braces-2.3.2.tgz";
        sha1 = "5979fd3f14cd531565e5fa2df1abfff1dfaee729";
      };
    }
    {
      name = "braces___braces_3.0.2.tgz";
      path = fetchurl {
        name = "braces___braces_3.0.2.tgz";
        url  = "https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz";
        sha1 = "3454e1a462ee8d599e236df336cd9ea4f8afe107";
      };
    }
    {
      name = "brorand___brorand_1.1.0.tgz";
      path = fetchurl {
        name = "brorand___brorand_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/brorand/-/brorand-1.1.0.tgz";
        sha1 = "12c25efe40a45e3c323eb8675a0a0ce57b22371f";
      };
    }
    {
      name = "browserfs___browserfs_1.4.3.tgz";
      path = fetchurl {
        name = "browserfs___browserfs_1.4.3.tgz";
        url  = "https://registry.yarnpkg.com/browserfs/-/browserfs-1.4.3.tgz";
        sha1 = "92ffc6063967612daccdb8566d3fc03f521205fb";
      };
    }
    {
      name = "browserify_aes___browserify_aes_1.2.0.tgz";
      path = fetchurl {
        name = "browserify_aes___browserify_aes_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-1.2.0.tgz";
        sha1 = "326734642f403dabc3003209853bb70ad428ef48";
      };
    }
    {
      name = "browserify_cipher___browserify_cipher_1.0.1.tgz";
      path = fetchurl {
        name = "browserify_cipher___browserify_cipher_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/browserify-cipher/-/browserify-cipher-1.0.1.tgz";
        sha1 = "8d6474c1b870bfdabcd3bcfcc1934a10e94f15f0";
      };
    }
    {
      name = "browserify_des___browserify_des_1.0.2.tgz";
      path = fetchurl {
        name = "browserify_des___browserify_des_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/browserify-des/-/browserify-des-1.0.2.tgz";
        sha1 = "3af4f1f59839403572f1c66204375f7a7f703e9c";
      };
    }
    {
      name = "browserify_rsa___browserify_rsa_4.0.1.tgz";
      path = fetchurl {
        name = "browserify_rsa___browserify_rsa_4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/browserify-rsa/-/browserify-rsa-4.0.1.tgz";
        sha1 = "21e0abfaf6f2029cf2fafb133567a701d4135524";
      };
    }
    {
      name = "browserify_sign___browserify_sign_4.0.4.tgz";
      path = fetchurl {
        name = "browserify_sign___browserify_sign_4.0.4.tgz";
        url  = "https://registry.yarnpkg.com/browserify-sign/-/browserify-sign-4.0.4.tgz";
        sha1 = "aa4eb68e5d7b658baa6bf6a57e630cbd7a93d298";
      };
    }
    {
      name = "browserify_zlib___browserify_zlib_0.2.0.tgz";
      path = fetchurl {
        name = "browserify_zlib___browserify_zlib_0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/browserify-zlib/-/browserify-zlib-0.2.0.tgz";
        sha1 = "2869459d9aa3be245fe8fe2ca1f46e2e7f54d73f";
      };
    }
    {
      name = "buffer_from___buffer_from_1.1.1.tgz";
      path = fetchurl {
        name = "buffer_from___buffer_from_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.1.tgz";
        sha1 = "32713bc028f75c02fdb710d7c7bcec1f2c6070ef";
      };
    }
    {
      name = "buffer_xor___buffer_xor_1.0.3.tgz";
      path = fetchurl {
        name = "buffer_xor___buffer_xor_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/buffer-xor/-/buffer-xor-1.0.3.tgz";
        sha1 = "26e61ed1422fb70dd42e6e36729ed51d855fe8d9";
      };
    }
    {
      name = "buffer___buffer_4.9.2.tgz";
      path = fetchurl {
        name = "buffer___buffer_4.9.2.tgz";
        url  = "https://registry.yarnpkg.com/buffer/-/buffer-4.9.2.tgz";
        sha1 = "230ead344002988644841ab0244af8c44bbe3ef8";
      };
    }
    {
      name = "builtin_modules___builtin_modules_1.1.1.tgz";
      path = fetchurl {
        name = "builtin_modules___builtin_modules_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-1.1.1.tgz";
        sha1 = "270f076c5a72c02f5b65a47df94c5fe3a278892f";
      };
    }
    {
      name = "builtin_status_codes___builtin_status_codes_3.0.0.tgz";
      path = fetchurl {
        name = "builtin_status_codes___builtin_status_codes_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz";
        sha1 = "85982878e21b98e1c66425e03d0174788f569ee8";
      };
    }
    {
      name = "cacache___cacache_11.3.3.tgz";
      path = fetchurl {
        name = "cacache___cacache_11.3.3.tgz";
        url  = "https://registry.yarnpkg.com/cacache/-/cacache-11.3.3.tgz";
        sha1 = "8bd29df8c6a718a6ebd2d010da4d7972ae3bbadc";
      };
    }
    {
      name = "cacache___cacache_12.0.4.tgz";
      path = fetchurl {
        name = "cacache___cacache_12.0.4.tgz";
        url  = "https://registry.yarnpkg.com/cacache/-/cacache-12.0.4.tgz";
        sha1 = "668bcbd105aeb5f1d92fe25570ec9525c8faa40c";
      };
    }
    {
      name = "cacache___cacache_13.0.1.tgz";
      path = fetchurl {
        name = "cacache___cacache_13.0.1.tgz";
        url  = "https://registry.yarnpkg.com/cacache/-/cacache-13.0.1.tgz";
        sha1 = "a8000c21697089082f85287a1aec6e382024a71c";
      };
    }
    {
      name = "cache_base___cache_base_1.0.1.tgz";
      path = fetchurl {
        name = "cache_base___cache_base_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/cache-base/-/cache-base-1.0.1.tgz";
        sha1 = "0a7f46416831c8b662ee36fe4e7c59d76f666ab2";
      };
    }
    {
      name = "camel_case___camel_case_3.0.0.tgz";
      path = fetchurl {
        name = "camel_case___camel_case_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/camel-case/-/camel-case-3.0.0.tgz";
        sha1 = "ca3c3688a4e9cf3a4cda777dc4dcbc713249cf73";
      };
    }
    {
      name = "camelcase___camelcase_5.3.1.tgz";
      path = fetchurl {
        name = "camelcase___camelcase_5.3.1.tgz";
        url  = "https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz";
        sha1 = "e3c9b31569e106811df242f715725a1f4c494320";
      };
    }
    {
      name = "canvas_color_tracker___canvas_color_tracker_1.1.2.tgz";
      path = fetchurl {
        name = "canvas_color_tracker___canvas_color_tracker_1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/canvas-color-tracker/-/canvas-color-tracker-1.1.2.tgz";
        sha1 = "3532817194b449576f9c172ca9a49ddec3ab2e96";
      };
    }
    {
      name = "chalk___chalk_2.4.2.tgz";
      path = fetchurl {
        name = "chalk___chalk_2.4.2.tgz";
        url  = "https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz";
        sha1 = "cd42541677a54333cf541a49108c1432b44c9424";
      };
    }
    {
      name = "chokidar___chokidar_2.1.8.tgz";
      path = fetchurl {
        name = "chokidar___chokidar_2.1.8.tgz";
        url  = "https://registry.yarnpkg.com/chokidar/-/chokidar-2.1.8.tgz";
        sha1 = "804b3a7b6a99358c3c5c61e71d8728f041cff917";
      };
    }
    {
      name = "chownr___chownr_1.1.4.tgz";
      path = fetchurl {
        name = "chownr___chownr_1.1.4.tgz";
        url  = "https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz";
        sha1 = "6fc9d7b42d32a583596337666e7d08084da2cc6b";
      };
    }
    {
      name = "chrome_trace_event___chrome_trace_event_1.0.2.tgz";
      path = fetchurl {
        name = "chrome_trace_event___chrome_trace_event_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.2.tgz";
        sha1 = "234090ee97c7d4ad1a2c4beae27505deffc608a4";
      };
    }
    {
      name = "cipher_base___cipher_base_1.0.4.tgz";
      path = fetchurl {
        name = "cipher_base___cipher_base_1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/cipher-base/-/cipher-base-1.0.4.tgz";
        sha1 = "8760e4ecc272f4c363532f926d874aae2c1397de";
      };
    }
    {
      name = "class_utils___class_utils_0.3.6.tgz";
      path = fetchurl {
        name = "class_utils___class_utils_0.3.6.tgz";
        url  = "https://registry.yarnpkg.com/class-utils/-/class-utils-0.3.6.tgz";
        sha1 = "f93369ae8b9a7ce02fd41faad0ca83033190c463";
      };
    }
    {
      name = "clean_css___clean_css_4.2.3.tgz";
      path = fetchurl {
        name = "clean_css___clean_css_4.2.3.tgz";
        url  = "https://registry.yarnpkg.com/clean-css/-/clean-css-4.2.3.tgz";
        sha1 = "507b5de7d97b48ee53d84adb0160ff6216380f78";
      };
    }
    {
      name = "clean_stack___clean_stack_2.2.0.tgz";
      path = fetchurl {
        name = "clean_stack___clean_stack_2.2.0.tgz";
        url  = "https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz";
        sha1 = "ee8472dbb129e727b31e8a10a427dee9dfe4008b";
      };
    }
    {
      name = "cliui___cliui_5.0.0.tgz";
      path = fetchurl {
        name = "cliui___cliui_5.0.0.tgz";
        url  = "https://registry.yarnpkg.com/cliui/-/cliui-5.0.0.tgz";
        sha1 = "deefcfdb2e800784aa34f46fa08e06851c7bbbc5";
      };
    }
    {
      name = "code_point_at___code_point_at_1.1.0.tgz";
      path = fetchurl {
        name = "code_point_at___code_point_at_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz";
        sha1 = "0d070b4d043a5bea33a2f1a40e2edb3d9a4ccf77";
      };
    }
    {
      name = "collection_visit___collection_visit_1.0.0.tgz";
      path = fetchurl {
        name = "collection_visit___collection_visit_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/collection-visit/-/collection-visit-1.0.0.tgz";
        sha1 = "4bc0373c164bc3291b4d368c829cf1a80a59dca0";
      };
    }
    {
      name = "color_convert___color_convert_1.9.3.tgz";
      path = fetchurl {
        name = "color_convert___color_convert_1.9.3.tgz";
        url  = "https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz";
        sha1 = "bb71850690e1f136567de629d2d5471deda4c1e8";
      };
    }
    {
      name = "color_name___color_name_1.1.3.tgz";
      path = fetchurl {
        name = "color_name___color_name_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz";
        sha1 = "a7d0558bd89c42f795dd42328f740831ca53bc25";
      };
    }
    {
      name = "commander___commander_2.20.3.tgz";
      path = fetchurl {
        name = "commander___commander_2.20.3.tgz";
        url  = "https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz";
        sha1 = "fd485e84c03eb4881c20722ba48035e8531aeb33";
      };
    }
    {
      name = "commander___commander_2.17.1.tgz";
      path = fetchurl {
        name = "commander___commander_2.17.1.tgz";
        url  = "https://registry.yarnpkg.com/commander/-/commander-2.17.1.tgz";
        sha1 = "bd77ab7de6de94205ceacc72f1716d29f20a77bf";
      };
    }
    {
      name = "commander___commander_2.19.0.tgz";
      path = fetchurl {
        name = "commander___commander_2.19.0.tgz";
        url  = "https://registry.yarnpkg.com/commander/-/commander-2.19.0.tgz";
        sha1 = "f6198aa84e5b83c46054b94ddedbfed5ee9ff12a";
      };
    }
    {
      name = "commondir___commondir_1.0.1.tgz";
      path = fetchurl {
        name = "commondir___commondir_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/commondir/-/commondir-1.0.1.tgz";
        sha1 = "ddd800da0c66127393cca5950ea968a3aaf1253b";
      };
    }
    {
      name = "component_emitter___component_emitter_1.3.0.tgz";
      path = fetchurl {
        name = "component_emitter___component_emitter_1.3.0.tgz";
        url  = "https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.3.0.tgz";
        sha1 = "16e4070fba8ae29b679f2215853ee181ab2eabc0";
      };
    }
    {
      name = "concat_map___concat_map_0.0.1.tgz";
      path = fetchurl {
        name = "concat_map___concat_map_0.0.1.tgz";
        url  = "https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      };
    }
    {
      name = "concat_stream___concat_stream_1.6.2.tgz";
      path = fetchurl {
        name = "concat_stream___concat_stream_1.6.2.tgz";
        url  = "https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.2.tgz";
        sha1 = "904bdf194cd3122fc675c77fc4ac3d4ff0fd1a34";
      };
    }
    {
      name = "console_browserify___console_browserify_1.2.0.tgz";
      path = fetchurl {
        name = "console_browserify___console_browserify_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/console-browserify/-/console-browserify-1.2.0.tgz";
        sha1 = "67063cef57ceb6cf4993a2ab3a55840ae8c49336";
      };
    }
    {
      name = "console_control_strings___console_control_strings_1.1.0.tgz";
      path = fetchurl {
        name = "console_control_strings___console_control_strings_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz";
        sha1 = "3d7cf4464db6446ea644bf4b39507f9851008e8e";
      };
    }
    {
      name = "constants_browserify___constants_browserify_1.0.0.tgz";
      path = fetchurl {
        name = "constants_browserify___constants_browserify_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/constants-browserify/-/constants-browserify-1.0.0.tgz";
        sha1 = "c20b96d8c617748aaf1c16021760cd27fcb8cb75";
      };
    }
    {
      name = "copy_concurrently___copy_concurrently_1.0.5.tgz";
      path = fetchurl {
        name = "copy_concurrently___copy_concurrently_1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/copy-concurrently/-/copy-concurrently-1.0.5.tgz";
        sha1 = "92297398cae34937fcafd6ec8139c18051f0b5e0";
      };
    }
    {
      name = "copy_descriptor___copy_descriptor_0.1.1.tgz";
      path = fetchurl {
        name = "copy_descriptor___copy_descriptor_0.1.1.tgz";
        url  = "https://registry.yarnpkg.com/copy-descriptor/-/copy-descriptor-0.1.1.tgz";
        sha1 = "676f6eb3c39997c2ee1ac3a924fd6124748f578d";
      };
    }
    {
      name = "copy_webpack_plugin___copy_webpack_plugin_5.1.1.tgz";
      path = fetchurl {
        name = "copy_webpack_plugin___copy_webpack_plugin_5.1.1.tgz";
        url  = "https://registry.yarnpkg.com/copy-webpack-plugin/-/copy-webpack-plugin-5.1.1.tgz";
        sha1 = "5481a03dea1123d88a988c6ff8b78247214f0b88";
      };
    }
    {
      name = "core_util_is___core_util_is_1.0.2.tgz";
      path = fetchurl {
        name = "core_util_is___core_util_is_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    }
    {
      name = "create_ecdh___create_ecdh_4.0.3.tgz";
      path = fetchurl {
        name = "create_ecdh___create_ecdh_4.0.3.tgz";
        url  = "https://registry.yarnpkg.com/create-ecdh/-/create-ecdh-4.0.3.tgz";
        sha1 = "c9111b6f33045c4697f144787f9254cdc77c45ff";
      };
    }
    {
      name = "create_hash___create_hash_1.2.0.tgz";
      path = fetchurl {
        name = "create_hash___create_hash_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/create-hash/-/create-hash-1.2.0.tgz";
        sha1 = "889078af11a63756bcfb59bd221996be3a9ef196";
      };
    }
    {
      name = "create_hmac___create_hmac_1.1.7.tgz";
      path = fetchurl {
        name = "create_hmac___create_hmac_1.1.7.tgz";
        url  = "https://registry.yarnpkg.com/create-hmac/-/create-hmac-1.1.7.tgz";
        sha1 = "69170c78b3ab957147b2b8b04572e47ead2243ff";
      };
    }
    {
      name = "cross_spawn___cross_spawn_6.0.5.tgz";
      path = fetchurl {
        name = "cross_spawn___cross_spawn_6.0.5.tgz";
        url  = "https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-6.0.5.tgz";
        sha1 = "4a5ec7c64dfae22c3a14124dbacdee846d80cbc4";
      };
    }
    {
      name = "crypto_browserify___crypto_browserify_3.12.0.tgz";
      path = fetchurl {
        name = "crypto_browserify___crypto_browserify_3.12.0.tgz";
        url  = "https://registry.yarnpkg.com/crypto-browserify/-/crypto-browserify-3.12.0.tgz";
        sha1 = "396cf9f3137f03e4b8e532c58f698254e00f80ec";
      };
    }
    {
      name = "css_select___css_select_1.2.0.tgz";
      path = fetchurl {
        name = "css_select___css_select_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/css-select/-/css-select-1.2.0.tgz";
        sha1 = "2b3a110539c5355f1cd8d314623e870b121ec858";
      };
    }
    {
      name = "css_what___css_what_2.1.3.tgz";
      path = fetchurl {
        name = "css_what___css_what_2.1.3.tgz";
        url  = "https://registry.yarnpkg.com/css-what/-/css-what-2.1.3.tgz";
        sha1 = "a6d7604573365fe74686c3f311c56513d88285f2";
      };
    }
    {
      name = "csstype___csstype_2.6.10.tgz";
      path = fetchurl {
        name = "csstype___csstype_2.6.10.tgz";
        url  = "https://registry.yarnpkg.com/csstype/-/csstype-2.6.10.tgz";
        sha1 = "e63af50e66d7c266edb6b32909cfd0aabe03928b";
      };
    }
    {
      name = "cyclist___cyclist_1.0.1.tgz";
      path = fetchurl {
        name = "cyclist___cyclist_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/cyclist/-/cyclist-1.0.1.tgz";
        sha1 = "596e9698fd0c80e12038c2b82d6eb1b35b6224d9";
      };
    }
    {
      name = "d3_array___d3_array_1.2.4.tgz";
      path = fetchurl {
        name = "d3_array___d3_array_1.2.4.tgz";
        url  = "https://registry.yarnpkg.com/d3-array/-/d3-array-1.2.4.tgz";
        sha1 = "635ce4d5eea759f6f605863dbcfc30edc737f71f";
      };
    }
    {
      name = "d3_axis___d3_axis_1.0.12.tgz";
      path = fetchurl {
        name = "d3_axis___d3_axis_1.0.12.tgz";
        url  = "https://registry.yarnpkg.com/d3-axis/-/d3-axis-1.0.12.tgz";
        sha1 = "cdf20ba210cfbb43795af33756886fb3638daac9";
      };
    }
    {
      name = "d3_binarytree___d3_binarytree_0.1.8.tgz";
      path = fetchurl {
        name = "d3_binarytree___d3_binarytree_0.1.8.tgz";
        url  = "https://registry.yarnpkg.com/d3-binarytree/-/d3-binarytree-0.1.8.tgz";
        sha1 = "dc8d37e7dd4a43c0e78dd99bbc4c295b935696df";
      };
    }
    {
      name = "d3_brush___d3_brush_1.1.5.tgz";
      path = fetchurl {
        name = "d3_brush___d3_brush_1.1.5.tgz";
        url  = "https://registry.yarnpkg.com/d3-brush/-/d3-brush-1.1.5.tgz";
        sha1 = "066b8e84d17b192986030446c97c0fba7e1bacdc";
      };
    }
    {
      name = "d3_chord___d3_chord_1.0.6.tgz";
      path = fetchurl {
        name = "d3_chord___d3_chord_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/d3-chord/-/d3-chord-1.0.6.tgz";
        sha1 = "309157e3f2db2c752f0280fedd35f2067ccbb15f";
      };
    }
    {
      name = "d3_collection___d3_collection_1.0.7.tgz";
      path = fetchurl {
        name = "d3_collection___d3_collection_1.0.7.tgz";
        url  = "https://registry.yarnpkg.com/d3-collection/-/d3-collection-1.0.7.tgz";
        sha1 = "349bd2aa9977db071091c13144d5e4f16b5b310e";
      };
    }
    {
      name = "d3_color___d3_color_1.4.0.tgz";
      path = fetchurl {
        name = "d3_color___d3_color_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-color/-/d3-color-1.4.0.tgz";
        sha1 = "89c45a995ed773b13314f06460df26d60ba0ecaf";
      };
    }
    {
      name = "d3_contour___d3_contour_1.3.2.tgz";
      path = fetchurl {
        name = "d3_contour___d3_contour_1.3.2.tgz";
        url  = "https://registry.yarnpkg.com/d3-contour/-/d3-contour-1.3.2.tgz";
        sha1 = "652aacd500d2264cb3423cee10db69f6f59bead3";
      };
    }
    {
      name = "d3_dispatch___d3_dispatch_1.0.6.tgz";
      path = fetchurl {
        name = "d3_dispatch___d3_dispatch_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/d3-dispatch/-/d3-dispatch-1.0.6.tgz";
        sha1 = "00d37bcee4dd8cd97729dd893a0ac29caaba5d58";
      };
    }
    {
      name = "d3_drag___d3_drag_1.2.5.tgz";
      path = fetchurl {
        name = "d3_drag___d3_drag_1.2.5.tgz";
        url  = "https://registry.yarnpkg.com/d3-drag/-/d3-drag-1.2.5.tgz";
        sha1 = "2537f451acd39d31406677b7dc77c82f7d988f70";
      };
    }
    {
      name = "d3_dsv___d3_dsv_1.2.0.tgz";
      path = fetchurl {
        name = "d3_dsv___d3_dsv_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-dsv/-/d3-dsv-1.2.0.tgz";
        sha1 = "9d5f75c3a5f8abd611f74d3f5847b0d4338b885c";
      };
    }
    {
      name = "d3_ease___d3_ease_1.0.6.tgz";
      path = fetchurl {
        name = "d3_ease___d3_ease_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/d3-ease/-/d3-ease-1.0.6.tgz";
        sha1 = "ebdb6da22dfac0a22222f2d4da06f66c416a0ec0";
      };
    }
    {
      name = "d3_fetch___d3_fetch_1.1.2.tgz";
      path = fetchurl {
        name = "d3_fetch___d3_fetch_1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/d3-fetch/-/d3-fetch-1.1.2.tgz";
        sha1 = "957c8fbc6d4480599ba191b1b2518bf86b3e1be2";
      };
    }
    {
      name = "d3_force_3d___d3_force_3d_2.1.0.tgz";
      path = fetchurl {
        name = "d3_force_3d___d3_force_3d_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-force-3d/-/d3-force-3d-2.1.0.tgz";
        sha1 = "fa1f898d904e413f5187bbdd2efac2d3b92054f0";
      };
    }
    {
      name = "d3_force___d3_force_1.2.1.tgz";
      path = fetchurl {
        name = "d3_force___d3_force_1.2.1.tgz";
        url  = "https://registry.yarnpkg.com/d3-force/-/d3-force-1.2.1.tgz";
        sha1 = "fd29a5d1ff181c9e7f0669e4bd72bdb0e914ec0b";
      };
    }
    {
      name = "d3_format___d3_format_1.4.4.tgz";
      path = fetchurl {
        name = "d3_format___d3_format_1.4.4.tgz";
        url  = "https://registry.yarnpkg.com/d3-format/-/d3-format-1.4.4.tgz";
        sha1 = "356925f28d0fd7c7983bfad593726fce46844030";
      };
    }
    {
      name = "d3_geo___d3_geo_1.12.0.tgz";
      path = fetchurl {
        name = "d3_geo___d3_geo_1.12.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-geo/-/d3-geo-1.12.0.tgz";
        sha1 = "58ddbdf4d9db5f199db69d1b7c93dca6454a6f24";
      };
    }
    {
      name = "d3_hierarchy___d3_hierarchy_1.1.9.tgz";
      path = fetchurl {
        name = "d3_hierarchy___d3_hierarchy_1.1.9.tgz";
        url  = "https://registry.yarnpkg.com/d3-hierarchy/-/d3-hierarchy-1.1.9.tgz";
        sha1 = "2f6bee24caaea43f8dc37545fa01628559647a83";
      };
    }
    {
      name = "d3_interpolate___d3_interpolate_1.4.0.tgz";
      path = fetchurl {
        name = "d3_interpolate___d3_interpolate_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-interpolate/-/d3-interpolate-1.4.0.tgz";
        sha1 = "526e79e2d80daa383f9e0c1c1c7dcc0f0583e987";
      };
    }
    {
      name = "d3_octree___d3_octree_0.1.8.tgz";
      path = fetchurl {
        name = "d3_octree___d3_octree_0.1.8.tgz";
        url  = "https://registry.yarnpkg.com/d3-octree/-/d3-octree-0.1.8.tgz";
        sha1 = "a7b16d0432b9551ad2b1145f2c25b5461fd991cf";
      };
    }
    {
      name = "d3_path___d3_path_1.0.9.tgz";
      path = fetchurl {
        name = "d3_path___d3_path_1.0.9.tgz";
        url  = "https://registry.yarnpkg.com/d3-path/-/d3-path-1.0.9.tgz";
        sha1 = "48c050bb1fe8c262493a8caf5524e3e9591701cf";
      };
    }
    {
      name = "d3_polygon___d3_polygon_1.0.6.tgz";
      path = fetchurl {
        name = "d3_polygon___d3_polygon_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/d3-polygon/-/d3-polygon-1.0.6.tgz";
        sha1 = "0bf8cb8180a6dc107f518ddf7975e12abbfbd38e";
      };
    }
    {
      name = "d3_quadtree___d3_quadtree_1.0.7.tgz";
      path = fetchurl {
        name = "d3_quadtree___d3_quadtree_1.0.7.tgz";
        url  = "https://registry.yarnpkg.com/d3-quadtree/-/d3-quadtree-1.0.7.tgz";
        sha1 = "ca8b84df7bb53763fe3c2f24bd435137f4e53135";
      };
    }
    {
      name = "d3_random___d3_random_1.1.2.tgz";
      path = fetchurl {
        name = "d3_random___d3_random_1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/d3-random/-/d3-random-1.1.2.tgz";
        sha1 = "2833be7c124360bf9e2d3fd4f33847cfe6cab291";
      };
    }
    {
      name = "d3_scale_chromatic___d3_scale_chromatic_1.5.0.tgz";
      path = fetchurl {
        name = "d3_scale_chromatic___d3_scale_chromatic_1.5.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-scale-chromatic/-/d3-scale-chromatic-1.5.0.tgz";
        sha1 = "54e333fc78212f439b14641fb55801dd81135a98";
      };
    }
    {
      name = "d3_scale___d3_scale_2.2.2.tgz";
      path = fetchurl {
        name = "d3_scale___d3_scale_2.2.2.tgz";
        url  = "https://registry.yarnpkg.com/d3-scale/-/d3-scale-2.2.2.tgz";
        sha1 = "4e880e0b2745acaaddd3ede26a9e908a9e17b81f";
      };
    }
    {
      name = "d3_scale___d3_scale_3.2.1.tgz";
      path = fetchurl {
        name = "d3_scale___d3_scale_3.2.1.tgz";
        url  = "https://registry.yarnpkg.com/d3-scale/-/d3-scale-3.2.1.tgz";
        sha1 = "da1684adce7261b4bc7a76fe193d887f0e909e69";
      };
    }
    {
      name = "d3_selection___d3_selection_1.4.1.tgz";
      path = fetchurl {
        name = "d3_selection___d3_selection_1.4.1.tgz";
        url  = "https://registry.yarnpkg.com/d3-selection/-/d3-selection-1.4.1.tgz";
        sha1 = "98eedbbe085fbda5bafa2f9e3f3a2f4d7d622a98";
      };
    }
    {
      name = "d3_shape___d3_shape_1.3.7.tgz";
      path = fetchurl {
        name = "d3_shape___d3_shape_1.3.7.tgz";
        url  = "https://registry.yarnpkg.com/d3-shape/-/d3-shape-1.3.7.tgz";
        sha1 = "df63801be07bc986bc54f63789b4fe502992b5d7";
      };
    }
    {
      name = "d3_time_format___d3_time_format_2.2.3.tgz";
      path = fetchurl {
        name = "d3_time_format___d3_time_format_2.2.3.tgz";
        url  = "https://registry.yarnpkg.com/d3-time-format/-/d3-time-format-2.2.3.tgz";
        sha1 = "0c9a12ee28342b2037e5ea1cf0b9eb4dd75f29cb";
      };
    }
    {
      name = "d3_time___d3_time_1.1.0.tgz";
      path = fetchurl {
        name = "d3_time___d3_time_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/d3-time/-/d3-time-1.1.0.tgz";
        sha1 = "b1e19d307dae9c900b7e5b25ffc5dcc249a8a0f1";
      };
    }
    {
      name = "d3_timer___d3_timer_1.0.10.tgz";
      path = fetchurl {
        name = "d3_timer___d3_timer_1.0.10.tgz";
        url  = "https://registry.yarnpkg.com/d3-timer/-/d3-timer-1.0.10.tgz";
        sha1 = "dfe76b8a91748831b13b6d9c793ffbd508dd9de5";
      };
    }
    {
      name = "d3_transition___d3_transition_1.3.2.tgz";
      path = fetchurl {
        name = "d3_transition___d3_transition_1.3.2.tgz";
        url  = "https://registry.yarnpkg.com/d3-transition/-/d3-transition-1.3.2.tgz";
        sha1 = "a98ef2151be8d8600543434c1ca80140ae23b398";
      };
    }
    {
      name = "d3_voronoi___d3_voronoi_1.1.4.tgz";
      path = fetchurl {
        name = "d3_voronoi___d3_voronoi_1.1.4.tgz";
        url  = "https://registry.yarnpkg.com/d3-voronoi/-/d3-voronoi-1.1.4.tgz";
        sha1 = "dd3c78d7653d2bb359284ae478645d95944c8297";
      };
    }
    {
      name = "d3_zoom___d3_zoom_1.8.3.tgz";
      path = fetchurl {
        name = "d3_zoom___d3_zoom_1.8.3.tgz";
        url  = "https://registry.yarnpkg.com/d3-zoom/-/d3-zoom-1.8.3.tgz";
        sha1 = "b6a3dbe738c7763121cd05b8a7795ffe17f4fc0a";
      };
    }
    {
      name = "d3___d3_5.15.1.tgz";
      path = fetchurl {
        name = "d3___d3_5.15.1.tgz";
        url  = "https://registry.yarnpkg.com/d3/-/d3-5.15.1.tgz";
        sha1 = "7a8f32208559505bf1f56537a31c3fb8e76a519b";
      };
    }
    {
      name = "debounce___debounce_1.2.0.tgz";
      path = fetchurl {
        name = "debounce___debounce_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/debounce/-/debounce-1.2.0.tgz";
        sha1 = "44a540abc0ea9943018dc0eaa95cce87f65cd131";
      };
    }
    {
      name = "debug___debug_2.6.9.tgz";
      path = fetchurl {
        name = "debug___debug_2.6.9.tgz";
        url  = "https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz";
        sha1 = "5d128515df134ff327e90a4c93f4e077a536341f";
      };
    }
    {
      name = "debug___debug_3.2.6.tgz";
      path = fetchurl {
        name = "debug___debug_3.2.6.tgz";
        url  = "https://registry.yarnpkg.com/debug/-/debug-3.2.6.tgz";
        sha1 = "e83d17de16d8a7efb7717edbe5fb10135eee629b";
      };
    }
    {
      name = "decamelize___decamelize_1.2.0.tgz";
      path = fetchurl {
        name = "decamelize___decamelize_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz";
        sha1 = "f6534d15148269b20352e7bee26f501f9a191290";
      };
    }
    {
      name = "decode_uri_component___decode_uri_component_0.2.0.tgz";
      path = fetchurl {
        name = "decode_uri_component___decode_uri_component_0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/decode-uri-component/-/decode-uri-component-0.2.0.tgz";
        sha1 = "eb3913333458775cb84cd1a1fae062106bb87545";
      };
    }
    {
      name = "deep_extend___deep_extend_0.6.0.tgz";
      path = fetchurl {
        name = "deep_extend___deep_extend_0.6.0.tgz";
        url  = "https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz";
        sha1 = "c4fa7c95404a17a9c3e8ca7e1537312b736330ac";
      };
    }
    {
      name = "define_properties___define_properties_1.1.3.tgz";
      path = fetchurl {
        name = "define_properties___define_properties_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.3.tgz";
        sha1 = "cf88da6cbee26fe6db7094f61d870cbd84cee9f1";
      };
    }
    {
      name = "define_property___define_property_0.2.5.tgz";
      path = fetchurl {
        name = "define_property___define_property_0.2.5.tgz";
        url  = "https://registry.yarnpkg.com/define-property/-/define-property-0.2.5.tgz";
        sha1 = "c35b1ef918ec3c990f9a5bc57be04aacec5c8116";
      };
    }
    {
      name = "define_property___define_property_1.0.0.tgz";
      path = fetchurl {
        name = "define_property___define_property_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/define-property/-/define-property-1.0.0.tgz";
        sha1 = "769ebaaf3f4a63aad3af9e8d304c9bbe79bfb0e6";
      };
    }
    {
      name = "define_property___define_property_2.0.2.tgz";
      path = fetchurl {
        name = "define_property___define_property_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/define-property/-/define-property-2.0.2.tgz";
        sha1 = "d459689e8d654ba77e02a817f8710d702cb16e9d";
      };
    }
    {
      name = "delegates___delegates_1.0.0.tgz";
      path = fetchurl {
        name = "delegates___delegates_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz";
        sha1 = "84c6e159b81904fdca59a0ef44cd870d31250f9a";
      };
    }
    {
      name = "des.js___des.js_1.0.1.tgz";
      path = fetchurl {
        name = "des.js___des.js_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/des.js/-/des.js-1.0.1.tgz";
        sha1 = "5382142e1bdc53f85d86d53e5f4aa7deb91e0843";
      };
    }
    {
      name = "detect_file___detect_file_1.0.0.tgz";
      path = fetchurl {
        name = "detect_file___detect_file_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/detect-file/-/detect-file-1.0.0.tgz";
        sha1 = "f0d66d03672a825cb1b73bdb3fe62310c8e552b7";
      };
    }
    {
      name = "detect_libc___detect_libc_1.0.3.tgz";
      path = fetchurl {
        name = "detect_libc___detect_libc_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/detect-libc/-/detect-libc-1.0.3.tgz";
        sha1 = "fa137c4bd698edf55cd5cd02ac559f91a4c4ba9b";
      };
    }
    {
      name = "diff___diff_4.0.2.tgz";
      path = fetchurl {
        name = "diff___diff_4.0.2.tgz";
        url  = "https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz";
        sha1 = "60f3aecb89d5fae520c11aa19efc2bb982aade7d";
      };
    }
    {
      name = "diffie_hellman___diffie_hellman_5.0.3.tgz";
      path = fetchurl {
        name = "diffie_hellman___diffie_hellman_5.0.3.tgz";
        url  = "https://registry.yarnpkg.com/diffie-hellman/-/diffie-hellman-5.0.3.tgz";
        sha1 = "40e8ee98f55a2149607146921c63e1ae5f3d2875";
      };
    }
    {
      name = "dir_glob___dir_glob_2.2.2.tgz";
      path = fetchurl {
        name = "dir_glob___dir_glob_2.2.2.tgz";
        url  = "https://registry.yarnpkg.com/dir-glob/-/dir-glob-2.2.2.tgz";
        sha1 = "fa09f0694153c8918b18ba0deafae94769fc50c4";
      };
    }
    {
      name = "dom_converter___dom_converter_0.2.0.tgz";
      path = fetchurl {
        name = "dom_converter___dom_converter_0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/dom-converter/-/dom-converter-0.2.0.tgz";
        sha1 = "6721a9daee2e293682955b6afe416771627bb768";
      };
    }
    {
      name = "dom_serializer___dom_serializer_0.2.2.tgz";
      path = fetchurl {
        name = "dom_serializer___dom_serializer_0.2.2.tgz";
        url  = "https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-0.2.2.tgz";
        sha1 = "1afb81f533717175d478655debc5e332d9f9bb51";
      };
    }
    {
      name = "domain_browser___domain_browser_1.2.0.tgz";
      path = fetchurl {
        name = "domain_browser___domain_browser_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/domain-browser/-/domain-browser-1.2.0.tgz";
        sha1 = "3d31f50191a6749dd1375a7f522e823d42e54eda";
      };
    }
    {
      name = "domelementtype___domelementtype_1.3.1.tgz";
      path = fetchurl {
        name = "domelementtype___domelementtype_1.3.1.tgz";
        url  = "https://registry.yarnpkg.com/domelementtype/-/domelementtype-1.3.1.tgz";
        sha1 = "d048c44b37b0d10a7f2a3d5fee3f4333d790481f";
      };
    }
    {
      name = "domelementtype___domelementtype_2.0.1.tgz";
      path = fetchurl {
        name = "domelementtype___domelementtype_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/domelementtype/-/domelementtype-2.0.1.tgz";
        sha1 = "1f8bdfe91f5a78063274e803b4bdcedf6e94f94d";
      };
    }
    {
      name = "domhandler___domhandler_2.4.2.tgz";
      path = fetchurl {
        name = "domhandler___domhandler_2.4.2.tgz";
        url  = "https://registry.yarnpkg.com/domhandler/-/domhandler-2.4.2.tgz";
        sha1 = "8805097e933d65e85546f726d60f5eb88b44f803";
      };
    }
    {
      name = "domutils___domutils_1.5.1.tgz";
      path = fetchurl {
        name = "domutils___domutils_1.5.1.tgz";
        url  = "https://registry.yarnpkg.com/domutils/-/domutils-1.5.1.tgz";
        sha1 = "dcd8488a26f563d61079e48c9f7b7e32373682cf";
      };
    }
    {
      name = "duplexify___duplexify_3.7.1.tgz";
      path = fetchurl {
        name = "duplexify___duplexify_3.7.1.tgz";
        url  = "https://registry.yarnpkg.com/duplexify/-/duplexify-3.7.1.tgz";
        sha1 = "2a4df5317f6ccfd91f86d6fd25d8d8a103b88309";
      };
    }
    {
      name = "elliptic___elliptic_6.5.2.tgz";
      path = fetchurl {
        name = "elliptic___elliptic_6.5.2.tgz";
        url  = "https://registry.yarnpkg.com/elliptic/-/elliptic-6.5.2.tgz";
        sha1 = "05c5678d7173c049d8ca433552224a495d0e3762";
      };
    }
    {
      name = "emoji_regex___emoji_regex_7.0.3.tgz";
      path = fetchurl {
        name = "emoji_regex___emoji_regex_7.0.3.tgz";
        url  = "https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-7.0.3.tgz";
        sha1 = "933a04052860c85e83c122479c4748a8e4c72156";
      };
    }
    {
      name = "emojis_list___emojis_list_2.1.0.tgz";
      path = fetchurl {
        name = "emojis_list___emojis_list_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/emojis-list/-/emojis-list-2.1.0.tgz";
        sha1 = "4daa4d9db00f9819880c79fa457ae5b09a1fd389";
      };
    }
    {
      name = "emojis_list___emojis_list_3.0.0.tgz";
      path = fetchurl {
        name = "emojis_list___emojis_list_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz";
        sha1 = "5570662046ad29e2e916e71aae260abdff4f6a78";
      };
    }
    {
      name = "end_of_stream___end_of_stream_1.4.4.tgz";
      path = fetchurl {
        name = "end_of_stream___end_of_stream_1.4.4.tgz";
        url  = "https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz";
        sha1 = "5ae64a5f45057baf3626ec14da0ca5e4b2431eb0";
      };
    }
    {
      name = "enhanced_resolve___enhanced_resolve_4.1.0.tgz";
      path = fetchurl {
        name = "enhanced_resolve___enhanced_resolve_4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-4.1.0.tgz";
        sha1 = "41c7e0bfdfe74ac1ffe1e57ad6a5c6c9f3742a7f";
      };
    }
    {
      name = "enhanced_resolve___enhanced_resolve_4.1.1.tgz";
      path = fetchurl {
        name = "enhanced_resolve___enhanced_resolve_4.1.1.tgz";
        url  = "https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-4.1.1.tgz";
        sha1 = "2937e2b8066cd0fe7ce0990a98f0d71a35189f66";
      };
    }
    {
      name = "entities___entities_1.1.2.tgz";
      path = fetchurl {
        name = "entities___entities_1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/entities/-/entities-1.1.2.tgz";
        sha1 = "bdfa735299664dfafd34529ed4f8522a275fea56";
      };
    }
    {
      name = "entities___entities_2.0.0.tgz";
      path = fetchurl {
        name = "entities___entities_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/entities/-/entities-2.0.0.tgz";
        sha1 = "68d6084cab1b079767540d80e56a39b423e4abf4";
      };
    }
    {
      name = "errno___errno_0.1.7.tgz";
      path = fetchurl {
        name = "errno___errno_0.1.7.tgz";
        url  = "https://registry.yarnpkg.com/errno/-/errno-0.1.7.tgz";
        sha1 = "4684d71779ad39af177e3f007996f7c67c852618";
      };
    }
    {
      name = "es_abstract___es_abstract_1.17.5.tgz";
      path = fetchurl {
        name = "es_abstract___es_abstract_1.17.5.tgz";
        url  = "https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.17.5.tgz";
        sha1 = "d8c9d1d66c8981fb9200e2251d799eee92774ae9";
      };
    }
    {
      name = "es_to_primitive___es_to_primitive_1.2.1.tgz";
      path = fetchurl {
        name = "es_to_primitive___es_to_primitive_1.2.1.tgz";
        url  = "https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz";
        sha1 = "e55cd4c9cdc188bcefb03b366c736323fc5c898a";
      };
    }
    {
      name = "escape_string_regexp___escape_string_regexp_1.0.5.tgz";
      path = fetchurl {
        name = "escape_string_regexp___escape_string_regexp_1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
        sha1 = "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4";
      };
    }
    {
      name = "eslint_scope___eslint_scope_4.0.3.tgz";
      path = fetchurl {
        name = "eslint_scope___eslint_scope_4.0.3.tgz";
        url  = "https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-4.0.3.tgz";
        sha1 = "ca03833310f6889a3264781aa82e63eb9cfe7848";
      };
    }
    {
      name = "esprima___esprima_4.0.1.tgz";
      path = fetchurl {
        name = "esprima___esprima_4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz";
        sha1 = "13b04cdb3e6c5d19df91ab6987a8695619b0aa71";
      };
    }
    {
      name = "esrecurse___esrecurse_4.2.1.tgz";
      path = fetchurl {
        name = "esrecurse___esrecurse_4.2.1.tgz";
        url  = "https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.2.1.tgz";
        sha1 = "007a3b9fdbc2b3bb87e4879ea19c92fdbd3942cf";
      };
    }
    {
      name = "estraverse___estraverse_4.3.0.tgz";
      path = fetchurl {
        name = "estraverse___estraverse_4.3.0.tgz";
        url  = "https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz";
        sha1 = "398ad3f3c5a24948be7725e83d11a7de28cdbd1d";
      };
    }
    {
      name = "events___events_3.1.0.tgz";
      path = fetchurl {
        name = "events___events_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/events/-/events-3.1.0.tgz";
        sha1 = "84279af1b34cb75aa88bf5ff291f6d0bd9b31a59";
      };
    }
    {
      name = "evp_bytestokey___evp_bytestokey_1.0.3.tgz";
      path = fetchurl {
        name = "evp_bytestokey___evp_bytestokey_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz";
        sha1 = "7fcbdb198dc71959432efe13842684e0525acb02";
      };
    }
    {
      name = "execa___execa_1.0.0.tgz";
      path = fetchurl {
        name = "execa___execa_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/execa/-/execa-1.0.0.tgz";
        sha1 = "c6236a5bb4df6d6f15e88e7f017798216749ddd8";
      };
    }
    {
      name = "expand_brackets___expand_brackets_2.1.4.tgz";
      path = fetchurl {
        name = "expand_brackets___expand_brackets_2.1.4.tgz";
        url  = "https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-2.1.4.tgz";
        sha1 = "b77735e315ce30f6b6eff0f83b04151a22449622";
      };
    }
    {
      name = "expand_tilde___expand_tilde_2.0.2.tgz";
      path = fetchurl {
        name = "expand_tilde___expand_tilde_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/expand-tilde/-/expand-tilde-2.0.2.tgz";
        sha1 = "97e801aa052df02454de46b02bf621642cdc8502";
      };
    }
    {
      name = "extend_shallow___extend_shallow_2.0.1.tgz";
      path = fetchurl {
        name = "extend_shallow___extend_shallow_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-2.0.1.tgz";
        sha1 = "51af7d614ad9a9f610ea1bafbb989d6b1c56890f";
      };
    }
    {
      name = "extend_shallow___extend_shallow_3.0.2.tgz";
      path = fetchurl {
        name = "extend_shallow___extend_shallow_3.0.2.tgz";
        url  = "https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-3.0.2.tgz";
        sha1 = "26a71aaf073b39fb2127172746131c2704028db8";
      };
    }
    {
      name = "extglob___extglob_2.0.4.tgz";
      path = fetchurl {
        name = "extglob___extglob_2.0.4.tgz";
        url  = "https://registry.yarnpkg.com/extglob/-/extglob-2.0.4.tgz";
        sha1 = "ad00fe4dc612a9232e8718711dc5cb5ab0285543";
      };
    }
    {
      name = "fast_deep_equal___fast_deep_equal_3.1.1.tgz";
      path = fetchurl {
        name = "fast_deep_equal___fast_deep_equal_3.1.1.tgz";
        url  = "https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.1.tgz";
        sha1 = "545145077c501491e33b15ec408c294376e94ae4";
      };
    }
    {
      name = "fast_json_stable_stringify___fast_json_stable_stringify_2.1.0.tgz";
      path = fetchurl {
        name = "fast_json_stable_stringify___fast_json_stable_stringify_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz";
        sha1 = "874bf69c6f404c2b5d99c481341399fd55892633";
      };
    }
    {
      name = "figgy_pudding___figgy_pudding_3.5.2.tgz";
      path = fetchurl {
        name = "figgy_pudding___figgy_pudding_3.5.2.tgz";
        url  = "https://registry.yarnpkg.com/figgy-pudding/-/figgy-pudding-3.5.2.tgz";
        sha1 = "b4eee8148abb01dcf1d1ac34367d59e12fa61d6e";
      };
    }
    {
      name = "file_uri_to_path___file_uri_to_path_1.0.0.tgz";
      path = fetchurl {
        name = "file_uri_to_path___file_uri_to_path_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/file-uri-to-path/-/file-uri-to-path-1.0.0.tgz";
        sha1 = "553a7b8446ff6f684359c445f1e37a05dacc33dd";
      };
    }
    {
      name = "fill_range___fill_range_4.0.0.tgz";
      path = fetchurl {
        name = "fill_range___fill_range_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/fill-range/-/fill-range-4.0.0.tgz";
        sha1 = "d544811d428f98eb06a63dc402d2403c328c38f7";
      };
    }
    {
      name = "fill_range___fill_range_7.0.1.tgz";
      path = fetchurl {
        name = "fill_range___fill_range_7.0.1.tgz";
        url  = "https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz";
        sha1 = "1919a6a7c75fe38b2c7c77e5198535da9acdda40";
      };
    }
    {
      name = "find_cache_dir___find_cache_dir_2.1.0.tgz";
      path = fetchurl {
        name = "find_cache_dir___find_cache_dir_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-2.1.0.tgz";
        sha1 = "8d0f94cd13fe43c6c7c261a0d86115ca918c05f7";
      };
    }
    {
      name = "find_cache_dir___find_cache_dir_3.3.1.tgz";
      path = fetchurl {
        name = "find_cache_dir___find_cache_dir_3.3.1.tgz";
        url  = "https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-3.3.1.tgz";
        sha1 = "89b33fad4a4670daa94f855f7fbe31d6d84fe880";
      };
    }
    {
      name = "find_up___find_up_3.0.0.tgz";
      path = fetchurl {
        name = "find_up___find_up_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz";
        sha1 = "49169f1d7993430646da61ecc5ae355c21c97b73";
      };
    }
    {
      name = "find_up___find_up_4.1.0.tgz";
      path = fetchurl {
        name = "find_up___find_up_4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz";
        sha1 = "97afe7d6cdc0bc5928584b7c8d7b16e8a9aa5d19";
      };
    }
    {
      name = "findup_sync___findup_sync_3.0.0.tgz";
      path = fetchurl {
        name = "findup_sync___findup_sync_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/findup-sync/-/findup-sync-3.0.0.tgz";
        sha1 = "17b108f9ee512dfb7a5c7f3c8b27ea9e1a9c08d1";
      };
    }
    {
      name = "flush_write_stream___flush_write_stream_1.1.1.tgz";
      path = fetchurl {
        name = "flush_write_stream___flush_write_stream_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/flush-write-stream/-/flush-write-stream-1.1.1.tgz";
        sha1 = "8dd7d873a1babc207d94ead0c2e0e44276ebf2e8";
      };
    }
    {
      name = "for_in___for_in_1.0.2.tgz";
      path = fetchurl {
        name = "for_in___for_in_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/for-in/-/for-in-1.0.2.tgz";
        sha1 = "81068d295a8142ec0ac726c6e2200c30fb6d5e80";
      };
    }
    {
      name = "force_graph___force_graph_1.28.0.tgz";
      path = fetchurl {
        name = "force_graph___force_graph_1.28.0.tgz";
        url  = "https://registry.yarnpkg.com/force-graph/-/force-graph-1.28.0.tgz";
        sha1 = "2da4e705c22ab16c221eff3231c499bee80ea6d2";
      };
    }
    {
      name = "fragment_cache___fragment_cache_0.2.1.tgz";
      path = fetchurl {
        name = "fragment_cache___fragment_cache_0.2.1.tgz";
        url  = "https://registry.yarnpkg.com/fragment-cache/-/fragment-cache-0.2.1.tgz";
        sha1 = "4290fad27f13e89be7f33799c6bc5a0abfff0d19";
      };
    }
    {
      name = "from2___from2_2.3.0.tgz";
      path = fetchurl {
        name = "from2___from2_2.3.0.tgz";
        url  = "https://registry.yarnpkg.com/from2/-/from2-2.3.0.tgz";
        sha1 = "8bfb5502bde4a4d36cfdeea007fcca21d7e382af";
      };
    }
    {
      name = "fromentries___fromentries_1.2.0.tgz";
      path = fetchurl {
        name = "fromentries___fromentries_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/fromentries/-/fromentries-1.2.0.tgz";
        sha1 = "e6aa06f240d6267f913cea422075ef88b63e7897";
      };
    }
    {
      name = "fs_minipass___fs_minipass_1.2.7.tgz";
      path = fetchurl {
        name = "fs_minipass___fs_minipass_1.2.7.tgz";
        url  = "https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-1.2.7.tgz";
        sha1 = "ccff8570841e7fe4265693da88936c55aed7f7c7";
      };
    }
    {
      name = "fs_minipass___fs_minipass_2.1.0.tgz";
      path = fetchurl {
        name = "fs_minipass___fs_minipass_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz";
        sha1 = "7f5036fdbf12c63c169190cbe4199c852271f9fb";
      };
    }
    {
      name = "fs_write_stream_atomic___fs_write_stream_atomic_1.0.10.tgz";
      path = fetchurl {
        name = "fs_write_stream_atomic___fs_write_stream_atomic_1.0.10.tgz";
        url  = "https://registry.yarnpkg.com/fs-write-stream-atomic/-/fs-write-stream-atomic-1.0.10.tgz";
        sha1 = "b47df53493ef911df75731e70a9ded0189db40c9";
      };
    }
    {
      name = "fs.realpath___fs.realpath_1.0.0.tgz";
      path = fetchurl {
        name = "fs.realpath___fs.realpath_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
      };
    }
    {
      name = "fsevents___fsevents_1.2.12.tgz";
      path = fetchurl {
        name = "fsevents___fsevents_1.2.12.tgz";
        url  = "https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.12.tgz";
        sha1 = "db7e0d8ec3b0b45724fd4d83d43554a8f1f0de5c";
      };
    }
    {
      name = "function_bind___function_bind_1.1.1.tgz";
      path = fetchurl {
        name = "function_bind___function_bind_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz";
        sha1 = "a56899d3ea3c9bab874bb9773b7c5ede92f4895d";
      };
    }
    {
      name = "gauge___gauge_2.7.4.tgz";
      path = fetchurl {
        name = "gauge___gauge_2.7.4.tgz";
        url  = "https://registry.yarnpkg.com/gauge/-/gauge-2.7.4.tgz";
        sha1 = "2c03405c7538c39d7eb37b317022e325fb018bf7";
      };
    }
    {
      name = "get_caller_file___get_caller_file_2.0.5.tgz";
      path = fetchurl {
        name = "get_caller_file___get_caller_file_2.0.5.tgz";
        url  = "https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz";
        sha1 = "4f94412a82db32f36e3b0b9741f8a97feb031f7e";
      };
    }
    {
      name = "get_stream___get_stream_4.1.0.tgz";
      path = fetchurl {
        name = "get_stream___get_stream_4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/get-stream/-/get-stream-4.1.0.tgz";
        sha1 = "c1b255575f3dc21d59bfc79cd3d2b46b1c3a54b5";
      };
    }
    {
      name = "get_value___get_value_2.0.6.tgz";
      path = fetchurl {
        name = "get_value___get_value_2.0.6.tgz";
        url  = "https://registry.yarnpkg.com/get-value/-/get-value-2.0.6.tgz";
        sha1 = "dc15ca1c672387ca76bd37ac0a395ba2042a2c28";
      };
    }
    {
      name = "glob_parent___glob_parent_3.1.0.tgz";
      path = fetchurl {
        name = "glob_parent___glob_parent_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/glob-parent/-/glob-parent-3.1.0.tgz";
        sha1 = "9e6af6299d8d3bd2bd40430832bd113df906c5ae";
      };
    }
    {
      name = "glob___glob_7.1.6.tgz";
      path = fetchurl {
        name = "glob___glob_7.1.6.tgz";
        url  = "https://registry.yarnpkg.com/glob/-/glob-7.1.6.tgz";
        sha1 = "141f33b81a7c2492e125594307480c46679278a6";
      };
    }
    {
      name = "global_modules___global_modules_2.0.0.tgz";
      path = fetchurl {
        name = "global_modules___global_modules_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/global-modules/-/global-modules-2.0.0.tgz";
        sha1 = "997605ad2345f27f51539bea26574421215c7780";
      };
    }
    {
      name = "global_modules___global_modules_1.0.0.tgz";
      path = fetchurl {
        name = "global_modules___global_modules_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/global-modules/-/global-modules-1.0.0.tgz";
        sha1 = "6d770f0eb523ac78164d72b5e71a8877265cc3ea";
      };
    }
    {
      name = "global_prefix___global_prefix_1.0.2.tgz";
      path = fetchurl {
        name = "global_prefix___global_prefix_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/global-prefix/-/global-prefix-1.0.2.tgz";
        sha1 = "dbf743c6c14992593c655568cb66ed32c0122ebe";
      };
    }
    {
      name = "global_prefix___global_prefix_3.0.0.tgz";
      path = fetchurl {
        name = "global_prefix___global_prefix_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/global-prefix/-/global-prefix-3.0.0.tgz";
        sha1 = "fc85f73064df69f50421f47f883fe5b913ba9b97";
      };
    }
    {
      name = "globby___globby_7.1.1.tgz";
      path = fetchurl {
        name = "globby___globby_7.1.1.tgz";
        url  = "https://registry.yarnpkg.com/globby/-/globby-7.1.1.tgz";
        sha1 = "fb2ccff9401f8600945dfada97440cca972b8680";
      };
    }
    {
      name = "graceful_fs___graceful_fs_4.2.3.tgz";
      path = fetchurl {
        name = "graceful_fs___graceful_fs_4.2.3.tgz";
        url  = "https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.3.tgz";
        sha1 = "4a12ff1b60376ef09862c2093edd908328be8423";
      };
    }
    {
      name = "has_flag___has_flag_3.0.0.tgz";
      path = fetchurl {
        name = "has_flag___has_flag_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz";
        sha1 = "b5d454dc2199ae225699f3467e5a07f3b955bafd";
      };
    }
    {
      name = "has_flag___has_flag_4.0.0.tgz";
      path = fetchurl {
        name = "has_flag___has_flag_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz";
        sha1 = "944771fd9c81c81265c4d6941860da06bb59479b";
      };
    }
    {
      name = "has_symbols___has_symbols_1.0.1.tgz";
      path = fetchurl {
        name = "has_symbols___has_symbols_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.1.tgz";
        sha1 = "9f5214758a44196c406d9bd76cebf81ec2dd31e8";
      };
    }
    {
      name = "has_unicode___has_unicode_2.0.1.tgz";
      path = fetchurl {
        name = "has_unicode___has_unicode_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz";
        sha1 = "e0e6fe6a28cf51138855e086d1691e771de2a8b9";
      };
    }
    {
      name = "has_value___has_value_0.3.1.tgz";
      path = fetchurl {
        name = "has_value___has_value_0.3.1.tgz";
        url  = "https://registry.yarnpkg.com/has-value/-/has-value-0.3.1.tgz";
        sha1 = "7b1f58bada62ca827ec0a2078025654845995e1f";
      };
    }
    {
      name = "has_value___has_value_1.0.0.tgz";
      path = fetchurl {
        name = "has_value___has_value_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/has-value/-/has-value-1.0.0.tgz";
        sha1 = "18b281da585b1c5c51def24c930ed29a0be6b177";
      };
    }
    {
      name = "has_values___has_values_0.1.4.tgz";
      path = fetchurl {
        name = "has_values___has_values_0.1.4.tgz";
        url  = "https://registry.yarnpkg.com/has-values/-/has-values-0.1.4.tgz";
        sha1 = "6d61de95d91dfca9b9a02089ad384bff8f62b771";
      };
    }
    {
      name = "has_values___has_values_1.0.0.tgz";
      path = fetchurl {
        name = "has_values___has_values_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/has-values/-/has-values-1.0.0.tgz";
        sha1 = "95b0b63fec2146619a6fe57fe75628d5a39efe4f";
      };
    }
    {
      name = "has___has_1.0.3.tgz";
      path = fetchurl {
        name = "has___has_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/has/-/has-1.0.3.tgz";
        sha1 = "722d7cbfc1f6aa8241f16dd814e011e1f41e8796";
      };
    }
    {
      name = "hash_base___hash_base_3.0.4.tgz";
      path = fetchurl {
        name = "hash_base___hash_base_3.0.4.tgz";
        url  = "https://registry.yarnpkg.com/hash-base/-/hash-base-3.0.4.tgz";
        sha1 = "5fc8686847ecd73499403319a6b0a3f3f6ae4918";
      };
    }
    {
      name = "hash.js___hash.js_1.1.7.tgz";
      path = fetchurl {
        name = "hash.js___hash.js_1.1.7.tgz";
        url  = "https://registry.yarnpkg.com/hash.js/-/hash.js-1.1.7.tgz";
        sha1 = "0babca538e8d4ee4a0f8988d68866537a003cf42";
      };
    }
    {
      name = "he___he_1.2.0.tgz";
      path = fetchurl {
        name = "he___he_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/he/-/he-1.2.0.tgz";
        sha1 = "84ae65fa7eafb165fddb61566ae14baf05664f0f";
      };
    }
    {
      name = "hmac_drbg___hmac_drbg_1.0.1.tgz";
      path = fetchurl {
        name = "hmac_drbg___hmac_drbg_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/hmac-drbg/-/hmac-drbg-1.0.1.tgz";
        sha1 = "d2745701025a6c775a6c545793ed502fc0c649a1";
      };
    }
    {
      name = "homedir_polyfill___homedir_polyfill_1.0.3.tgz";
      path = fetchurl {
        name = "homedir_polyfill___homedir_polyfill_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/homedir-polyfill/-/homedir-polyfill-1.0.3.tgz";
        sha1 = "743298cef4e5af3e194161fbadcc2151d3a058e8";
      };
    }
    {
      name = "html_minifier___html_minifier_3.5.21.tgz";
      path = fetchurl {
        name = "html_minifier___html_minifier_3.5.21.tgz";
        url  = "https://registry.yarnpkg.com/html-minifier/-/html-minifier-3.5.21.tgz";
        sha1 = "d0040e054730e354db008463593194015212d20c";
      };
    }
    {
      name = "html_webpack_plugin___html_webpack_plugin_3.2.0.tgz";
      path = fetchurl {
        name = "html_webpack_plugin___html_webpack_plugin_3.2.0.tgz";
        url  = "https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-3.2.0.tgz";
        sha1 = "b01abbd723acaaa7b37b6af4492ebda03d9dd37b";
      };
    }
    {
      name = "htmlparser2___htmlparser2_3.10.1.tgz";
      path = fetchurl {
        name = "htmlparser2___htmlparser2_3.10.1.tgz";
        url  = "https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-3.10.1.tgz";
        sha1 = "bd679dc3f59897b6a34bb10749c855bb53a9392f";
      };
    }
    {
      name = "https_browserify___https_browserify_1.0.0.tgz";
      path = fetchurl {
        name = "https_browserify___https_browserify_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/https-browserify/-/https-browserify-1.0.0.tgz";
        sha1 = "ec06c10e0a34c0f2faf199f7fd7fc78fffd03c73";
      };
    }
    {
      name = "iconv_lite___iconv_lite_0.4.24.tgz";
      path = fetchurl {
        name = "iconv_lite___iconv_lite_0.4.24.tgz";
        url  = "https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz";
        sha1 = "2022b4b25fbddc21d2f524974a474aafe733908b";
      };
    }
    {
      name = "ieee754___ieee754_1.1.13.tgz";
      path = fetchurl {
        name = "ieee754___ieee754_1.1.13.tgz";
        url  = "https://registry.yarnpkg.com/ieee754/-/ieee754-1.1.13.tgz";
        sha1 = "ec168558e95aa181fd87d37f55c32bbcb6708b84";
      };
    }
    {
      name = "iferr___iferr_0.1.5.tgz";
      path = fetchurl {
        name = "iferr___iferr_0.1.5.tgz";
        url  = "https://registry.yarnpkg.com/iferr/-/iferr-0.1.5.tgz";
        sha1 = "c60eed69e6d8fdb6b3104a1fcbca1c192dc5b501";
      };
    }
    {
      name = "ignore_walk___ignore_walk_3.0.3.tgz";
      path = fetchurl {
        name = "ignore_walk___ignore_walk_3.0.3.tgz";
        url  = "https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-3.0.3.tgz";
        sha1 = "017e2447184bfeade7c238e4aefdd1e8f95b1e37";
      };
    }
    {
      name = "ignore___ignore_3.3.10.tgz";
      path = fetchurl {
        name = "ignore___ignore_3.3.10.tgz";
        url  = "https://registry.yarnpkg.com/ignore/-/ignore-3.3.10.tgz";
        sha1 = "0a97fb876986e8081c631160f8f9f389157f0043";
      };
    }
    {
      name = "import_local___import_local_2.0.0.tgz";
      path = fetchurl {
        name = "import_local___import_local_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/import-local/-/import-local-2.0.0.tgz";
        sha1 = "55070be38a5993cf18ef6db7e961f5bee5c5a09d";
      };
    }
    {
      name = "imurmurhash___imurmurhash_0.1.4.tgz";
      path = fetchurl {
        name = "imurmurhash___imurmurhash_0.1.4.tgz";
        url  = "https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz";
        sha1 = "9218b9b2b928a238b13dc4fb6b6d576f231453ea";
      };
    }
    {
      name = "indent_string___indent_string_4.0.0.tgz";
      path = fetchurl {
        name = "indent_string___indent_string_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz";
        sha1 = "624f8f4497d619b2d9768531d58f4122854d7251";
      };
    }
    {
      name = "index_array_by___index_array_by_1.3.0.tgz";
      path = fetchurl {
        name = "index_array_by___index_array_by_1.3.0.tgz";
        url  = "https://registry.yarnpkg.com/index-array-by/-/index-array-by-1.3.0.tgz";
        sha1 = "db5b37fcc75712d9b2393003b4106050af53d130";
      };
    }
    {
      name = "infer_owner___infer_owner_1.0.4.tgz";
      path = fetchurl {
        name = "infer_owner___infer_owner_1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz";
        sha1 = "c4cefcaa8e51051c2a40ba2ce8a3d27295af9467";
      };
    }
    {
      name = "inflight___inflight_1.0.6.tgz";
      path = fetchurl {
        name = "inflight___inflight_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz";
        sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
      };
    }
    {
      name = "inherits___inherits_2.0.4.tgz";
      path = fetchurl {
        name = "inherits___inherits_2.0.4.tgz";
        url  = "https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz";
        sha1 = "0fa2c64f932917c3433a0ded55363aae37416b7c";
      };
    }
    {
      name = "inherits___inherits_2.0.1.tgz";
      path = fetchurl {
        name = "inherits___inherits_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/inherits/-/inherits-2.0.1.tgz";
        sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
      };
    }
    {
      name = "inherits___inherits_2.0.3.tgz";
      path = fetchurl {
        name = "inherits___inherits_2.0.3.tgz";
        url  = "https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz";
        sha1 = "633c2c83e3da42a502f52466022480f4208261de";
      };
    }
    {
      name = "ini___ini_1.3.5.tgz";
      path = fetchurl {
        name = "ini___ini_1.3.5.tgz";
        url  = "https://registry.yarnpkg.com/ini/-/ini-1.3.5.tgz";
        sha1 = "eee25f56db1c9ec6085e0c22778083f596abf927";
      };
    }
    {
      name = "interpret___interpret_1.2.0.tgz";
      path = fetchurl {
        name = "interpret___interpret_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/interpret/-/interpret-1.2.0.tgz";
        sha1 = "d5061a6224be58e8083985f5014d844359576296";
      };
    }
    {
      name = "invert_kv___invert_kv_2.0.0.tgz";
      path = fetchurl {
        name = "invert_kv___invert_kv_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/invert-kv/-/invert-kv-2.0.0.tgz";
        sha1 = "7393f5afa59ec9ff5f67a27620d11c226e3eec02";
      };
    }
    {
      name = "is_accessor_descriptor___is_accessor_descriptor_0.1.6.tgz";
      path = fetchurl {
        name = "is_accessor_descriptor___is_accessor_descriptor_0.1.6.tgz";
        url  = "https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz";
        sha1 = "a9e12cb3ae8d876727eeef3843f8a0897b5c98d6";
      };
    }
    {
      name = "is_accessor_descriptor___is_accessor_descriptor_1.0.0.tgz";
      path = fetchurl {
        name = "is_accessor_descriptor___is_accessor_descriptor_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz";
        sha1 = "169c2f6d3df1f992618072365c9b0ea1f6878656";
      };
    }
    {
      name = "is_binary_path___is_binary_path_1.0.1.tgz";
      path = fetchurl {
        name = "is_binary_path___is_binary_path_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-1.0.1.tgz";
        sha1 = "75f16642b480f187a711c814161fd3a4a7655898";
      };
    }
    {
      name = "is_buffer___is_buffer_1.1.6.tgz";
      path = fetchurl {
        name = "is_buffer___is_buffer_1.1.6.tgz";
        url  = "https://registry.yarnpkg.com/is-buffer/-/is-buffer-1.1.6.tgz";
        sha1 = "efaa2ea9daa0d7ab2ea13a97b2b8ad51fefbe8be";
      };
    }
    {
      name = "is_callable___is_callable_1.1.5.tgz";
      path = fetchurl {
        name = "is_callable___is_callable_1.1.5.tgz";
        url  = "https://registry.yarnpkg.com/is-callable/-/is-callable-1.1.5.tgz";
        sha1 = "f7e46b596890456db74e7f6e976cb3273d06faab";
      };
    }
    {
      name = "is_data_descriptor___is_data_descriptor_0.1.4.tgz";
      path = fetchurl {
        name = "is_data_descriptor___is_data_descriptor_0.1.4.tgz";
        url  = "https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz";
        sha1 = "0b5ee648388e2c860282e793f1856fec3f301b56";
      };
    }
    {
      name = "is_data_descriptor___is_data_descriptor_1.0.0.tgz";
      path = fetchurl {
        name = "is_data_descriptor___is_data_descriptor_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz";
        sha1 = "d84876321d0e7add03990406abbbbd36ba9268c7";
      };
    }
    {
      name = "is_date_object___is_date_object_1.0.2.tgz";
      path = fetchurl {
        name = "is_date_object___is_date_object_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.2.tgz";
        sha1 = "bda736f2cd8fd06d32844e7743bfa7494c3bfd7e";
      };
    }
    {
      name = "is_descriptor___is_descriptor_0.1.6.tgz";
      path = fetchurl {
        name = "is_descriptor___is_descriptor_0.1.6.tgz";
        url  = "https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-0.1.6.tgz";
        sha1 = "366d8240dde487ca51823b1ab9f07a10a78251ca";
      };
    }
    {
      name = "is_descriptor___is_descriptor_1.0.2.tgz";
      path = fetchurl {
        name = "is_descriptor___is_descriptor_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-1.0.2.tgz";
        sha1 = "3b159746a66604b04f8c81524ba365c5f14d86ec";
      };
    }
    {
      name = "is_extendable___is_extendable_0.1.1.tgz";
      path = fetchurl {
        name = "is_extendable___is_extendable_0.1.1.tgz";
        url  = "https://registry.yarnpkg.com/is-extendable/-/is-extendable-0.1.1.tgz";
        sha1 = "62b110e289a471418e3ec36a617d472e301dfc89";
      };
    }
    {
      name = "is_extendable___is_extendable_1.0.1.tgz";
      path = fetchurl {
        name = "is_extendable___is_extendable_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/is-extendable/-/is-extendable-1.0.1.tgz";
        sha1 = "a7470f9e426733d81bd81e1155264e3a3507cab4";
      };
    }
    {
      name = "is_extglob___is_extglob_2.1.1.tgz";
      path = fetchurl {
        name = "is_extglob___is_extglob_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz";
        sha1 = "a88c02535791f02ed37c76a1b9ea9773c833f8c2";
      };
    }
    {
      name = "is_fullwidth_code_point___is_fullwidth_code_point_1.0.0.tgz";
      path = fetchurl {
        name = "is_fullwidth_code_point___is_fullwidth_code_point_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz";
        sha1 = "ef9e31386f031a7f0d643af82fde50c457ef00cb";
      };
    }
    {
      name = "is_fullwidth_code_point___is_fullwidth_code_point_2.0.0.tgz";
      path = fetchurl {
        name = "is_fullwidth_code_point___is_fullwidth_code_point_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz";
        sha1 = "a3b30a5c4f199183167aaab93beefae3ddfb654f";
      };
    }
    {
      name = "is_glob___is_glob_3.1.0.tgz";
      path = fetchurl {
        name = "is_glob___is_glob_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/is-glob/-/is-glob-3.1.0.tgz";
        sha1 = "7ba5ae24217804ac70707b96922567486cc3e84a";
      };
    }
    {
      name = "is_glob___is_glob_4.0.1.tgz";
      path = fetchurl {
        name = "is_glob___is_glob_4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.1.tgz";
        sha1 = "7567dbe9f2f5e2467bc77ab83c4a29482407a5dc";
      };
    }
    {
      name = "is_number___is_number_3.0.0.tgz";
      path = fetchurl {
        name = "is_number___is_number_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-number/-/is-number-3.0.0.tgz";
        sha1 = "24fd6201a4782cf50561c810276afc7d12d71195";
      };
    }
    {
      name = "is_number___is_number_7.0.0.tgz";
      path = fetchurl {
        name = "is_number___is_number_7.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz";
        sha1 = "7535345b896734d5f80c4d06c50955527a14f12b";
      };
    }
    {
      name = "is_plain_object___is_plain_object_2.0.4.tgz";
      path = fetchurl {
        name = "is_plain_object___is_plain_object_2.0.4.tgz";
        url  = "https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz";
        sha1 = "2c163b3fafb1b606d9d17928f05c2a1c38e07677";
      };
    }
    {
      name = "is_regex___is_regex_1.0.5.tgz";
      path = fetchurl {
        name = "is_regex___is_regex_1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/is-regex/-/is-regex-1.0.5.tgz";
        sha1 = "39d589a358bf18967f726967120b8fc1aed74eae";
      };
    }
    {
      name = "is_stream___is_stream_1.1.0.tgz";
      path = fetchurl {
        name = "is_stream___is_stream_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/is-stream/-/is-stream-1.1.0.tgz";
        sha1 = "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44";
      };
    }
    {
      name = "is_symbol___is_symbol_1.0.3.tgz";
      path = fetchurl {
        name = "is_symbol___is_symbol_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.3.tgz";
        sha1 = "38e1014b9e6329be0de9d24a414fd7441ec61937";
      };
    }
    {
      name = "is_windows___is_windows_1.0.2.tgz";
      path = fetchurl {
        name = "is_windows___is_windows_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/is-windows/-/is-windows-1.0.2.tgz";
        sha1 = "d1850eb9791ecd18e6182ce12a30f396634bb19d";
      };
    }
    {
      name = "is_wsl___is_wsl_1.1.0.tgz";
      path = fetchurl {
        name = "is_wsl___is_wsl_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/is-wsl/-/is-wsl-1.1.0.tgz";
        sha1 = "1f16e4aa22b04d1336b66188a66af3c600c3a66d";
      };
    }
    {
      name = "isarray___isarray_1.0.0.tgz";
      path = fetchurl {
        name = "isarray___isarray_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz";
        sha1 = "bb935d48582cba168c06834957a54a3e07124f11";
      };
    }
    {
      name = "isexe___isexe_2.0.0.tgz";
      path = fetchurl {
        name = "isexe___isexe_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz";
        sha1 = "e8fbf374dc556ff8947a10dcb0572d633f2cfa10";
      };
    }
    {
      name = "isobject___isobject_2.1.0.tgz";
      path = fetchurl {
        name = "isobject___isobject_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/isobject/-/isobject-2.1.0.tgz";
        sha1 = "f065561096a3f1da2ef46272f815c840d87e0c89";
      };
    }
    {
      name = "isobject___isobject_3.0.1.tgz";
      path = fetchurl {
        name = "isobject___isobject_3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz";
        sha1 = "4e431e92b11a9731636aa1f9c8d1ccbcfdab78df";
      };
    }
    {
      name = "jerrypick___jerrypick_1.0.3.tgz";
      path = fetchurl {
        name = "jerrypick___jerrypick_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/jerrypick/-/jerrypick-1.0.3.tgz";
        sha1 = "9310d601af6940ce2b3c5b83b97016337043b359";
      };
    }
    {
      name = "jest_worker___jest_worker_25.2.6.tgz";
      path = fetchurl {
        name = "jest_worker___jest_worker_25.2.6.tgz";
        url  = "https://registry.yarnpkg.com/jest-worker/-/jest-worker-25.2.6.tgz";
        sha1 = "d1292625326794ce187c38f51109faced3846c58";
      };
    }
    {
      name = "js_tokens___js_tokens_4.0.0.tgz";
      path = fetchurl {
        name = "js_tokens___js_tokens_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz";
        sha1 = "19203fb59991df98e3a287050d4647cdeaf32499";
      };
    }
    {
      name = "js_yaml___js_yaml_3.13.1.tgz";
      path = fetchurl {
        name = "js_yaml___js_yaml_3.13.1.tgz";
        url  = "https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.13.1.tgz";
        sha1 = "aff151b30bfdfa8e49e05da22e7415e9dfa37847";
      };
    }
    {
      name = "json_parse_better_errors___json_parse_better_errors_1.0.2.tgz";
      path = fetchurl {
        name = "json_parse_better_errors___json_parse_better_errors_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz";
        sha1 = "bb867cfb3450e69107c131d1c514bab3dc8bcaa9";
      };
    }
    {
      name = "json_schema_traverse___json_schema_traverse_0.4.1.tgz";
      path = fetchurl {
        name = "json_schema_traverse___json_schema_traverse_0.4.1.tgz";
        url  = "https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
        sha1 = "69f6a87d9513ab8bb8fe63bdb0979c448e684660";
      };
    }
    {
      name = "json5___json5_0.5.1.tgz";
      path = fetchurl {
        name = "json5___json5_0.5.1.tgz";
        url  = "https://registry.yarnpkg.com/json5/-/json5-0.5.1.tgz";
        sha1 = "1eade7acc012034ad84e2396767ead9fa5495821";
      };
    }
    {
      name = "json5___json5_1.0.1.tgz";
      path = fetchurl {
        name = "json5___json5_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/json5/-/json5-1.0.1.tgz";
        sha1 = "779fb0018604fa854eacbf6252180d83543e3dbe";
      };
    }
    {
      name = "kapsule___kapsule_1.13.3.tgz";
      path = fetchurl {
        name = "kapsule___kapsule_1.13.3.tgz";
        url  = "https://registry.yarnpkg.com/kapsule/-/kapsule-1.13.3.tgz";
        sha1 = "01092e9ee1f1da10e511d91b45e57198b1fe7b90";
      };
    }
    {
      name = "kind_of___kind_of_3.2.2.tgz";
      path = fetchurl {
        name = "kind_of___kind_of_3.2.2.tgz";
        url  = "https://registry.yarnpkg.com/kind-of/-/kind-of-3.2.2.tgz";
        sha1 = "31ea21a734bab9bbb0f32466d893aea51e4a3c64";
      };
    }
    {
      name = "kind_of___kind_of_4.0.0.tgz";
      path = fetchurl {
        name = "kind_of___kind_of_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/kind-of/-/kind-of-4.0.0.tgz";
        sha1 = "20813df3d712928b207378691a45066fae72dd57";
      };
    }
    {
      name = "kind_of___kind_of_5.1.0.tgz";
      path = fetchurl {
        name = "kind_of___kind_of_5.1.0.tgz";
        url  = "https://registry.yarnpkg.com/kind-of/-/kind-of-5.1.0.tgz";
        sha1 = "729c91e2d857b7a419a1f9aa65685c4c33f5845d";
      };
    }
    {
      name = "kind_of___kind_of_6.0.3.tgz";
      path = fetchurl {
        name = "kind_of___kind_of_6.0.3.tgz";
        url  = "https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz";
        sha1 = "07c05034a6c349fa06e24fa35aa76db4580ce4dd";
      };
    }
    {
      name = "lcid___lcid_2.0.0.tgz";
      path = fetchurl {
        name = "lcid___lcid_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/lcid/-/lcid-2.0.0.tgz";
        sha1 = "6ef5d2df60e52f82eb228a4c373e8d1f397253cf";
      };
    }
    {
      name = "lean_client_js_core___lean_client_js_core_1.2.12.tgz";
      path = fetchurl {
        name = "lean_client_js_core___lean_client_js_core_1.2.12.tgz";
        url  = "https://registry.yarnpkg.com/lean-client-js-core/-/lean-client-js-core-1.2.12.tgz";
        sha1 = "9d75919ba1f40b0cc79d427468d7be79ebe94b62";
      };
    }
    {
      name = "loader_runner___loader_runner_2.4.0.tgz";
      path = fetchurl {
        name = "loader_runner___loader_runner_2.4.0.tgz";
        url  = "https://registry.yarnpkg.com/loader-runner/-/loader-runner-2.4.0.tgz";
        sha1 = "ed47066bfe534d7e84c4c7b9998c2a75607d9357";
      };
    }
    {
      name = "loader_utils___loader_utils_1.2.3.tgz";
      path = fetchurl {
        name = "loader_utils___loader_utils_1.2.3.tgz";
        url  = "https://registry.yarnpkg.com/loader-utils/-/loader-utils-1.2.3.tgz";
        sha1 = "1ff5dc6911c9f0a062531a4c04b609406108c2c7";
      };
    }
    {
      name = "loader_utils___loader_utils_0.2.17.tgz";
      path = fetchurl {
        name = "loader_utils___loader_utils_0.2.17.tgz";
        url  = "https://registry.yarnpkg.com/loader-utils/-/loader-utils-0.2.17.tgz";
        sha1 = "f86e6374d43205a6e6c60e9196f17c0299bfb348";
      };
    }
    {
      name = "loader_utils___loader_utils_1.4.0.tgz";
      path = fetchurl {
        name = "loader_utils___loader_utils_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/loader-utils/-/loader-utils-1.4.0.tgz";
        sha1 = "c579b5e34cb34b1a74edc6c1fb36bfa371d5a613";
      };
    }
    {
      name = "locate_path___locate_path_3.0.0.tgz";
      path = fetchurl {
        name = "locate_path___locate_path_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz";
        sha1 = "dbec3b3ab759758071b58fe59fc41871af21400e";
      };
    }
    {
      name = "locate_path___locate_path_5.0.0.tgz";
      path = fetchurl {
        name = "locate_path___locate_path_5.0.0.tgz";
        url  = "https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz";
        sha1 = "1afba396afd676a6d42504d0a67a3a7eb9f62aa0";
      };
    }
    {
      name = "lodash.throttle___lodash.throttle_4.1.1.tgz";
      path = fetchurl {
        name = "lodash.throttle___lodash.throttle_4.1.1.tgz";
        url  = "https://registry.yarnpkg.com/lodash.throttle/-/lodash.throttle-4.1.1.tgz";
        sha1 = "c23e91b710242ac70c37f1e1cda9274cc39bf2f4";
      };
    }
    {
      name = "lodash___lodash_4.17.19.tgz";
      path = fetchurl {
        name = "lodash___lodash_4.17.19.tgz";
        url  = "https://registry.yarnpkg.com/lodash/-/lodash-4.17.19.tgz";
        sha1 = "e48ddedbe30b3321783c5b4301fbd353bc1e4a4b";
      };
    }
    {
      name = "loose_envify___loose_envify_1.4.0.tgz";
      path = fetchurl {
        name = "loose_envify___loose_envify_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz";
        sha1 = "71ee51fa7be4caec1a63839f7e682d8132d30caf";
      };
    }
    {
      name = "lower_case___lower_case_1.1.4.tgz";
      path = fetchurl {
        name = "lower_case___lower_case_1.1.4.tgz";
        url  = "https://registry.yarnpkg.com/lower-case/-/lower-case-1.1.4.tgz";
        sha1 = "9a2cabd1b9e8e0ae993a4bf7d5875c39c42e8eac";
      };
    }
    {
      name = "lru_cache___lru_cache_5.1.1.tgz";
      path = fetchurl {
        name = "lru_cache___lru_cache_5.1.1.tgz";
        url  = "https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz";
        sha1 = "1da27e6710271947695daf6848e847f01d84b920";
      };
    }
    {
      name = "make_dir___make_dir_2.1.0.tgz";
      path = fetchurl {
        name = "make_dir___make_dir_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/make-dir/-/make-dir-2.1.0.tgz";
        sha1 = "5f0310e18b8be898cc07009295a30ae41e91e6f5";
      };
    }
    {
      name = "make_dir___make_dir_3.0.2.tgz";
      path = fetchurl {
        name = "make_dir___make_dir_3.0.2.tgz";
        url  = "https://registry.yarnpkg.com/make-dir/-/make-dir-3.0.2.tgz";
        sha1 = "04a1acbf22221e1d6ef43559f43e05a90dbb4392";
      };
    }
    {
      name = "map_age_cleaner___map_age_cleaner_0.1.3.tgz";
      path = fetchurl {
        name = "map_age_cleaner___map_age_cleaner_0.1.3.tgz";
        url  = "https://registry.yarnpkg.com/map-age-cleaner/-/map-age-cleaner-0.1.3.tgz";
        sha1 = "7d583a7306434c055fe474b0f45078e6e1b4b92a";
      };
    }
    {
      name = "map_cache___map_cache_0.2.2.tgz";
      path = fetchurl {
        name = "map_cache___map_cache_0.2.2.tgz";
        url  = "https://registry.yarnpkg.com/map-cache/-/map-cache-0.2.2.tgz";
        sha1 = "c32abd0bd6525d9b051645bb4f26ac5dc98a0dbf";
      };
    }
    {
      name = "map_visit___map_visit_1.0.0.tgz";
      path = fetchurl {
        name = "map_visit___map_visit_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/map-visit/-/map-visit-1.0.0.tgz";
        sha1 = "ecdca8f13144e660f1b5bd41f12f3479d98dfb8f";
      };
    }
    {
      name = "md5.js___md5.js_1.3.5.tgz";
      path = fetchurl {
        name = "md5.js___md5.js_1.3.5.tgz";
        url  = "https://registry.yarnpkg.com/md5.js/-/md5.js-1.3.5.tgz";
        sha1 = "b5d07b8e3216e3e27cd728d72f70d1e6a342005f";
      };
    }
    {
      name = "mem___mem_4.3.0.tgz";
      path = fetchurl {
        name = "mem___mem_4.3.0.tgz";
        url  = "https://registry.yarnpkg.com/mem/-/mem-4.3.0.tgz";
        sha1 = "461af497bc4ae09608cdb2e60eefb69bff744178";
      };
    }
    {
      name = "memory_fs___memory_fs_0.4.1.tgz";
      path = fetchurl {
        name = "memory_fs___memory_fs_0.4.1.tgz";
        url  = "https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.4.1.tgz";
        sha1 = "3a9a20b8462523e447cfbc7e8bb80ed667bfc552";
      };
    }
    {
      name = "memory_fs___memory_fs_0.5.0.tgz";
      path = fetchurl {
        name = "memory_fs___memory_fs_0.5.0.tgz";
        url  = "https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.5.0.tgz";
        sha1 = "324c01288b88652966d161db77838720845a8e3c";
      };
    }
    {
      name = "merge_stream___merge_stream_2.0.0.tgz";
      path = fetchurl {
        name = "merge_stream___merge_stream_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz";
        sha1 = "52823629a14dd00c9770fb6ad47dc6310f2c1f60";
      };
    }
    {
      name = "micromatch___micromatch_3.1.10.tgz";
      path = fetchurl {
        name = "micromatch___micromatch_3.1.10.tgz";
        url  = "https://registry.yarnpkg.com/micromatch/-/micromatch-3.1.10.tgz";
        sha1 = "70859bc95c9840952f359a068a3fc49f9ecfac23";
      };
    }
    {
      name = "micromatch___micromatch_4.0.2.tgz";
      path = fetchurl {
        name = "micromatch___micromatch_4.0.2.tgz";
        url  = "https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.2.tgz";
        sha1 = "4fcb0999bf9fbc2fcbdd212f6d629b9a56c39259";
      };
    }
    {
      name = "miller_rabin___miller_rabin_4.0.1.tgz";
      path = fetchurl {
        name = "miller_rabin___miller_rabin_4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/miller-rabin/-/miller-rabin-4.0.1.tgz";
        sha1 = "f080351c865b0dc562a8462966daa53543c78a4d";
      };
    }
    {
      name = "mimic_fn___mimic_fn_2.1.0.tgz";
      path = fetchurl {
        name = "mimic_fn___mimic_fn_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz";
        sha1 = "7ed2c2ccccaf84d3ffcb7a69b57711fc2083401b";
      };
    }
    {
      name = "minimalistic_assert___minimalistic_assert_1.0.1.tgz";
      path = fetchurl {
        name = "minimalistic_assert___minimalistic_assert_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz";
        sha1 = "2e194de044626d4a10e7f7fbc00ce73e83e4d5c7";
      };
    }
    {
      name = "minimalistic_crypto_utils___minimalistic_crypto_utils_1.0.1.tgz";
      path = fetchurl {
        name = "minimalistic_crypto_utils___minimalistic_crypto_utils_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz";
        sha1 = "f6c00c1c0b082246e5c4d99dfb8c7c083b2b582a";
      };
    }
    {
      name = "minimatch___minimatch_3.0.4.tgz";
      path = fetchurl {
        name = "minimatch___minimatch_3.0.4.tgz";
        url  = "https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz";
        sha1 = "5166e286457f03306064be5497e8dbb0c3d32083";
      };
    }
    {
      name = "minimist___minimist_1.2.5.tgz";
      path = fetchurl {
        name = "minimist___minimist_1.2.5.tgz";
        url  = "https://registry.yarnpkg.com/minimist/-/minimist-1.2.5.tgz";
        sha1 = "67d66014b66a6a8aaa0c083c5fd58df4e4e97602";
      };
    }
    {
      name = "minipass_collect___minipass_collect_1.0.2.tgz";
      path = fetchurl {
        name = "minipass_collect___minipass_collect_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-1.0.2.tgz";
        sha1 = "22b813bf745dc6edba2576b940022ad6edc8c617";
      };
    }
    {
      name = "minipass_flush___minipass_flush_1.0.5.tgz";
      path = fetchurl {
        name = "minipass_flush___minipass_flush_1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/minipass-flush/-/minipass-flush-1.0.5.tgz";
        sha1 = "82e7135d7e89a50ffe64610a787953c4c4cbb373";
      };
    }
    {
      name = "minipass_pipeline___minipass_pipeline_1.2.2.tgz";
      path = fetchurl {
        name = "minipass_pipeline___minipass_pipeline_1.2.2.tgz";
        url  = "https://registry.yarnpkg.com/minipass-pipeline/-/minipass-pipeline-1.2.2.tgz";
        sha1 = "3dcb6bb4a546e32969c7ad710f2c79a86abba93a";
      };
    }
    {
      name = "minipass___minipass_2.9.0.tgz";
      path = fetchurl {
        name = "minipass___minipass_2.9.0.tgz";
        url  = "https://registry.yarnpkg.com/minipass/-/minipass-2.9.0.tgz";
        sha1 = "e713762e7d3e32fed803115cf93e04bca9fcc9a6";
      };
    }
    {
      name = "minipass___minipass_3.1.1.tgz";
      path = fetchurl {
        name = "minipass___minipass_3.1.1.tgz";
        url  = "https://registry.yarnpkg.com/minipass/-/minipass-3.1.1.tgz";
        sha1 = "7607ce778472a185ad6d89082aa2070f79cedcd5";
      };
    }
    {
      name = "minizlib___minizlib_1.3.3.tgz";
      path = fetchurl {
        name = "minizlib___minizlib_1.3.3.tgz";
        url  = "https://registry.yarnpkg.com/minizlib/-/minizlib-1.3.3.tgz";
        sha1 = "2290de96818a34c29551c8a8d301216bd65a861d";
      };
    }
    {
      name = "mississippi___mississippi_3.0.0.tgz";
      path = fetchurl {
        name = "mississippi___mississippi_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/mississippi/-/mississippi-3.0.0.tgz";
        sha1 = "ea0a3291f97e0b5e8776b363d5f0a12d94c67022";
      };
    }
    {
      name = "mixin_deep___mixin_deep_1.3.2.tgz";
      path = fetchurl {
        name = "mixin_deep___mixin_deep_1.3.2.tgz";
        url  = "https://registry.yarnpkg.com/mixin-deep/-/mixin-deep-1.3.2.tgz";
        sha1 = "1120b43dc359a785dce65b55b82e257ccf479566";
      };
    }
    {
      name = "mkdirp___mkdirp_0.5.3.tgz";
      path = fetchurl {
        name = "mkdirp___mkdirp_0.5.3.tgz";
        url  = "https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.3.tgz";
        sha1 = "5a514b7179259287952881e94410ec5465659f8c";
      };
    }
    {
      name = "mkdirp___mkdirp_0.5.5.tgz";
      path = fetchurl {
        name = "mkdirp___mkdirp_0.5.5.tgz";
        url  = "https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.5.tgz";
        sha1 = "d91cefd62d1436ca0f41620e251288d420099def";
      };
    }
    {
      name = "monaco_editor___monaco_editor_0.10.1.tgz";
      path = fetchurl {
        name = "monaco_editor___monaco_editor_0.10.1.tgz";
        url  = "https://registry.yarnpkg.com/monaco-editor/-/monaco-editor-0.10.1.tgz";
        sha1 = "8c96c4f15b6b5258bf92cbde93cad8a7e3007e14";
      };
    }
    {
      name = "move_concurrently___move_concurrently_1.0.1.tgz";
      path = fetchurl {
        name = "move_concurrently___move_concurrently_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/move-concurrently/-/move-concurrently-1.0.1.tgz";
        sha1 = "be2c005fda32e0b29af1f05d7c4b33214c701f92";
      };
    }
    {
      name = "ms___ms_2.0.0.tgz";
      path = fetchurl {
        name = "ms___ms_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz";
        sha1 = "5608aeadfc00be6c2901df5f9861788de0d597c8";
      };
    }
    {
      name = "ms___ms_2.1.2.tgz";
      path = fetchurl {
        name = "ms___ms_2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz";
        sha1 = "d09d1f357b443f493382a8eb3ccd183872ae6009";
      };
    }
    {
      name = "nan___nan_2.14.0.tgz";
      path = fetchurl {
        name = "nan___nan_2.14.0.tgz";
        url  = "https://registry.yarnpkg.com/nan/-/nan-2.14.0.tgz";
        sha1 = "7818f722027b2459a86f0295d434d1fc2336c52c";
      };
    }
    {
      name = "nanomatch___nanomatch_1.2.13.tgz";
      path = fetchurl {
        name = "nanomatch___nanomatch_1.2.13.tgz";
        url  = "https://registry.yarnpkg.com/nanomatch/-/nanomatch-1.2.13.tgz";
        sha1 = "b87a8aa4fc0de8fe6be88895b38983ff265bd119";
      };
    }
    {
      name = "needle___needle_2.3.3.tgz";
      path = fetchurl {
        name = "needle___needle_2.3.3.tgz";
        url  = "https://registry.yarnpkg.com/needle/-/needle-2.3.3.tgz";
        sha1 = "a041ad1d04a871b0ebb666f40baaf1fb47867117";
      };
    }
    {
      name = "neo_async___neo_async_2.6.1.tgz";
      path = fetchurl {
        name = "neo_async___neo_async_2.6.1.tgz";
        url  = "https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.1.tgz";
        sha1 = "ac27ada66167fa8849a6addd837f6b189ad2081c";
      };
    }
    {
      name = "nice_try___nice_try_1.0.5.tgz";
      path = fetchurl {
        name = "nice_try___nice_try_1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/nice-try/-/nice-try-1.0.5.tgz";
        sha1 = "a3378a7696ce7d223e88fc9b764bd7ef1089e366";
      };
    }
    {
      name = "no_case___no_case_2.3.2.tgz";
      path = fetchurl {
        name = "no_case___no_case_2.3.2.tgz";
        url  = "https://registry.yarnpkg.com/no-case/-/no-case-2.3.2.tgz";
        sha1 = "60b813396be39b3f1288a4c1ed5d1e7d28b464ac";
      };
    }
    {
      name = "node_libs_browser___node_libs_browser_2.2.1.tgz";
      path = fetchurl {
        name = "node_libs_browser___node_libs_browser_2.2.1.tgz";
        url  = "https://registry.yarnpkg.com/node-libs-browser/-/node-libs-browser-2.2.1.tgz";
        sha1 = "b64f513d18338625f90346d27b0d235e631f6425";
      };
    }
    {
      name = "node_pre_gyp___node_pre_gyp_0.14.0.tgz";
      path = fetchurl {
        name = "node_pre_gyp___node_pre_gyp_0.14.0.tgz";
        url  = "https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.14.0.tgz";
        sha1 = "9a0596533b877289bcad4e143982ca3d904ddc83";
      };
    }
    {
      name = "nopt___nopt_4.0.3.tgz";
      path = fetchurl {
        name = "nopt___nopt_4.0.3.tgz";
        url  = "https://registry.yarnpkg.com/nopt/-/nopt-4.0.3.tgz";
        sha1 = "a375cad9d02fd921278d954c2254d5aa57e15e48";
      };
    }
    {
      name = "normalize_path___normalize_path_2.1.1.tgz";
      path = fetchurl {
        name = "normalize_path___normalize_path_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/normalize-path/-/normalize-path-2.1.1.tgz";
        sha1 = "1ab28b556e198363a8c1a6f7e6fa20137fe6aed9";
      };
    }
    {
      name = "normalize_path___normalize_path_3.0.0.tgz";
      path = fetchurl {
        name = "normalize_path___normalize_path_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz";
        sha1 = "0dcd69ff23a1c9b11fd0978316644a0388216a65";
      };
    }
    {
      name = "npm_bundled___npm_bundled_1.1.1.tgz";
      path = fetchurl {
        name = "npm_bundled___npm_bundled_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-1.1.1.tgz";
        sha1 = "1edd570865a94cdb1bc8220775e29466c9fb234b";
      };
    }
    {
      name = "npm_normalize_package_bin___npm_normalize_package_bin_1.0.1.tgz";
      path = fetchurl {
        name = "npm_normalize_package_bin___npm_normalize_package_bin_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz";
        sha1 = "6e79a41f23fd235c0623218228da7d9c23b8f6e2";
      };
    }
    {
      name = "npm_packlist___npm_packlist_1.4.8.tgz";
      path = fetchurl {
        name = "npm_packlist___npm_packlist_1.4.8.tgz";
        url  = "https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-1.4.8.tgz";
        sha1 = "56ee6cc135b9f98ad3d51c1c95da22bbb9b2ef3e";
      };
    }
    {
      name = "npm_run_path___npm_run_path_2.0.2.tgz";
      path = fetchurl {
        name = "npm_run_path___npm_run_path_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-2.0.2.tgz";
        sha1 = "35a9232dfa35d7067b4cb2ddf2357b1871536c5f";
      };
    }
    {
      name = "npmlog___npmlog_4.1.2.tgz";
      path = fetchurl {
        name = "npmlog___npmlog_4.1.2.tgz";
        url  = "https://registry.yarnpkg.com/npmlog/-/npmlog-4.1.2.tgz";
        sha1 = "08a7f2a8bf734604779a9efa4ad5cc717abb954b";
      };
    }
    {
      name = "nth_check___nth_check_1.0.2.tgz";
      path = fetchurl {
        name = "nth_check___nth_check_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/nth-check/-/nth-check-1.0.2.tgz";
        sha1 = "b2bd295c37e3dd58a3bf0700376663ba4d9cf05c";
      };
    }
    {
      name = "number_is_nan___number_is_nan_1.0.1.tgz";
      path = fetchurl {
        name = "number_is_nan___number_is_nan_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz";
        sha1 = "097b602b53422a522c1afb8790318336941a011d";
      };
    }
    {
      name = "object_assign___object_assign_4.1.1.tgz";
      path = fetchurl {
        name = "object_assign___object_assign_4.1.1.tgz";
        url  = "https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz";
        sha1 = "2109adc7965887cfc05cbbd442cac8bfbb360863";
      };
    }
    {
      name = "object_copy___object_copy_0.1.0.tgz";
      path = fetchurl {
        name = "object_copy___object_copy_0.1.0.tgz";
        url  = "https://registry.yarnpkg.com/object-copy/-/object-copy-0.1.0.tgz";
        sha1 = "7e7d858b781bd7c991a41ba975ed3812754e998c";
      };
    }
    {
      name = "object_inspect___object_inspect_1.7.0.tgz";
      path = fetchurl {
        name = "object_inspect___object_inspect_1.7.0.tgz";
        url  = "https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.7.0.tgz";
        sha1 = "f4f6bd181ad77f006b5ece60bd0b6f398ff74a67";
      };
    }
    {
      name = "object_keys___object_keys_1.1.1.tgz";
      path = fetchurl {
        name = "object_keys___object_keys_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz";
        sha1 = "1c47f272df277f3b1daf061677d9c82e2322c60e";
      };
    }
    {
      name = "object_visit___object_visit_1.0.1.tgz";
      path = fetchurl {
        name = "object_visit___object_visit_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/object-visit/-/object-visit-1.0.1.tgz";
        sha1 = "f79c4493af0c5377b59fe39d395e41042dd045bb";
      };
    }
    {
      name = "object.assign___object.assign_4.1.0.tgz";
      path = fetchurl {
        name = "object.assign___object.assign_4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.0.tgz";
        sha1 = "968bf1100d7956bb3ca086f006f846b3bc4008da";
      };
    }
    {
      name = "object.getownpropertydescriptors___object.getownpropertydescriptors_2.1.0.tgz";
      path = fetchurl {
        name = "object.getownpropertydescriptors___object.getownpropertydescriptors_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.0.tgz";
        sha1 = "369bf1f9592d8ab89d712dced5cb81c7c5352649";
      };
    }
    {
      name = "object.pick___object.pick_1.3.0.tgz";
      path = fetchurl {
        name = "object.pick___object.pick_1.3.0.tgz";
        url  = "https://registry.yarnpkg.com/object.pick/-/object.pick-1.3.0.tgz";
        sha1 = "87a10ac4c1694bd2e1cbf53591a66141fb5dd747";
      };
    }
    {
      name = "once___once_1.4.0.tgz";
      path = fetchurl {
        name = "once___once_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    }
    {
      name = "opencollective_postinstall___opencollective_postinstall_2.0.2.tgz";
      path = fetchurl {
        name = "opencollective_postinstall___opencollective_postinstall_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/opencollective-postinstall/-/opencollective-postinstall-2.0.2.tgz";
        sha1 = "5657f1bede69b6e33a45939b061eb53d3c6c3a89";
      };
    }
    {
      name = "os_browserify___os_browserify_0.3.0.tgz";
      path = fetchurl {
        name = "os_browserify___os_browserify_0.3.0.tgz";
        url  = "https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.3.0.tgz";
        sha1 = "854373c7f5c2315914fc9bfc6bd8238fdda1ec27";
      };
    }
    {
      name = "os_homedir___os_homedir_1.0.2.tgz";
      path = fetchurl {
        name = "os_homedir___os_homedir_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz";
        sha1 = "ffbc4988336e0e833de0c168c7ef152121aa7fb3";
      };
    }
    {
      name = "os_locale___os_locale_3.1.0.tgz";
      path = fetchurl {
        name = "os_locale___os_locale_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/os-locale/-/os-locale-3.1.0.tgz";
        sha1 = "a802a6ee17f24c10483ab9935719cef4ed16bf1a";
      };
    }
    {
      name = "os_tmpdir___os_tmpdir_1.0.2.tgz";
      path = fetchurl {
        name = "os_tmpdir___os_tmpdir_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz";
        sha1 = "bbe67406c79aa85c5cfec766fe5734555dfa1274";
      };
    }
    {
      name = "osenv___osenv_0.1.5.tgz";
      path = fetchurl {
        name = "osenv___osenv_0.1.5.tgz";
        url  = "https://registry.yarnpkg.com/osenv/-/osenv-0.1.5.tgz";
        sha1 = "85cdfafaeb28e8677f416e287592b5f3f49ea410";
      };
    }
    {
      name = "p_defer___p_defer_1.0.0.tgz";
      path = fetchurl {
        name = "p_defer___p_defer_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/p-defer/-/p-defer-1.0.0.tgz";
        sha1 = "9f6eb182f6c9aa8cd743004a7d4f96b196b0fb0c";
      };
    }
    {
      name = "p_finally___p_finally_1.0.0.tgz";
      path = fetchurl {
        name = "p_finally___p_finally_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/p-finally/-/p-finally-1.0.0.tgz";
        sha1 = "3fbcfb15b899a44123b34b6dcc18b724336a2cae";
      };
    }
    {
      name = "p_is_promise___p_is_promise_2.1.0.tgz";
      path = fetchurl {
        name = "p_is_promise___p_is_promise_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/p-is-promise/-/p-is-promise-2.1.0.tgz";
        sha1 = "918cebaea248a62cf7ffab8e3bca8c5f882fc42e";
      };
    }
    {
      name = "p_limit___p_limit_2.3.0.tgz";
      path = fetchurl {
        name = "p_limit___p_limit_2.3.0.tgz";
        url  = "https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz";
        sha1 = "3dd33c647a214fdfffd835933eb086da0dc21db1";
      };
    }
    {
      name = "p_locate___p_locate_3.0.0.tgz";
      path = fetchurl {
        name = "p_locate___p_locate_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz";
        sha1 = "322d69a05c0264b25997d9f40cd8a891ab0064a4";
      };
    }
    {
      name = "p_locate___p_locate_4.1.0.tgz";
      path = fetchurl {
        name = "p_locate___p_locate_4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz";
        sha1 = "a3428bb7088b3a60292f66919278b7c297ad4f07";
      };
    }
    {
      name = "p_map___p_map_3.0.0.tgz";
      path = fetchurl {
        name = "p_map___p_map_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/p-map/-/p-map-3.0.0.tgz";
        sha1 = "d704d9af8a2ba684e2600d9a215983d4141a979d";
      };
    }
    {
      name = "p_try___p_try_2.2.0.tgz";
      path = fetchurl {
        name = "p_try___p_try_2.2.0.tgz";
        url  = "https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz";
        sha1 = "cb2868540e313d61de58fafbe35ce9004d5540e6";
      };
    }
    {
      name = "pako___pako_1.0.11.tgz";
      path = fetchurl {
        name = "pako___pako_1.0.11.tgz";
        url  = "https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz";
        sha1 = "6c9599d340d54dfd3946380252a35705a6b992bf";
      };
    }
    {
      name = "parallel_transform___parallel_transform_1.2.0.tgz";
      path = fetchurl {
        name = "parallel_transform___parallel_transform_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/parallel-transform/-/parallel-transform-1.2.0.tgz";
        sha1 = "9049ca37d6cb2182c3b1d2c720be94d14a5814fc";
      };
    }
    {
      name = "param_case___param_case_2.1.1.tgz";
      path = fetchurl {
        name = "param_case___param_case_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/param-case/-/param-case-2.1.1.tgz";
        sha1 = "df94fd8cf6531ecf75e6bef9a0858fbc72be2247";
      };
    }
    {
      name = "parse_asn1___parse_asn1_5.1.5.tgz";
      path = fetchurl {
        name = "parse_asn1___parse_asn1_5.1.5.tgz";
        url  = "https://registry.yarnpkg.com/parse-asn1/-/parse-asn1-5.1.5.tgz";
        sha1 = "003271343da58dc94cace494faef3d2147ecea0e";
      };
    }
    {
      name = "parse_passwd___parse_passwd_1.0.0.tgz";
      path = fetchurl {
        name = "parse_passwd___parse_passwd_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/parse-passwd/-/parse-passwd-1.0.0.tgz";
        sha1 = "6d5b934a456993b23d37f40a382d6f1666a8e5c6";
      };
    }
    {
      name = "pascalcase___pascalcase_0.1.1.tgz";
      path = fetchurl {
        name = "pascalcase___pascalcase_0.1.1.tgz";
        url  = "https://registry.yarnpkg.com/pascalcase/-/pascalcase-0.1.1.tgz";
        sha1 = "b363e55e8006ca6fe21784d2db22bd15d7917f14";
      };
    }
    {
      name = "path_browserify___path_browserify_0.0.1.tgz";
      path = fetchurl {
        name = "path_browserify___path_browserify_0.0.1.tgz";
        url  = "https://registry.yarnpkg.com/path-browserify/-/path-browserify-0.0.1.tgz";
        sha1 = "e6c4ddd7ed3aa27c68a20cc4e50e1a4ee83bbc4a";
      };
    }
    {
      name = "path_dirname___path_dirname_1.0.2.tgz";
      path = fetchurl {
        name = "path_dirname___path_dirname_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/path-dirname/-/path-dirname-1.0.2.tgz";
        sha1 = "cc33d24d525e099a5388c0336c6e32b9160609e0";
      };
    }
    {
      name = "path_exists___path_exists_3.0.0.tgz";
      path = fetchurl {
        name = "path_exists___path_exists_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz";
        sha1 = "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515";
      };
    }
    {
      name = "path_exists___path_exists_4.0.0.tgz";
      path = fetchurl {
        name = "path_exists___path_exists_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz";
        sha1 = "513bdbe2d3b95d7762e8c1137efa195c6c61b5b3";
      };
    }
    {
      name = "path_is_absolute___path_is_absolute_1.0.1.tgz";
      path = fetchurl {
        name = "path_is_absolute___path_is_absolute_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
      };
    }
    {
      name = "path_key___path_key_2.0.1.tgz";
      path = fetchurl {
        name = "path_key___path_key_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/path-key/-/path-key-2.0.1.tgz";
        sha1 = "411cadb574c5a140d3a4b1910d40d80cc9f40b40";
      };
    }
    {
      name = "path_parse___path_parse_1.0.6.tgz";
      path = fetchurl {
        name = "path_parse___path_parse_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.6.tgz";
        sha1 = "d62dbb5679405d72c4737ec58600e9ddcf06d24c";
      };
    }
    {
      name = "path_type___path_type_3.0.0.tgz";
      path = fetchurl {
        name = "path_type___path_type_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/path-type/-/path-type-3.0.0.tgz";
        sha1 = "cef31dc8e0a1a3bb0d105c0cd97cf3bf47f4e36f";
      };
    }
    {
      name = "pbkdf2___pbkdf2_3.0.17.tgz";
      path = fetchurl {
        name = "pbkdf2___pbkdf2_3.0.17.tgz";
        url  = "https://registry.yarnpkg.com/pbkdf2/-/pbkdf2-3.0.17.tgz";
        sha1 = "976c206530617b14ebb32114239f7b09336e93a6";
      };
    }
    {
      name = "picomatch___picomatch_2.2.2.tgz";
      path = fetchurl {
        name = "picomatch___picomatch_2.2.2.tgz";
        url  = "https://registry.yarnpkg.com/picomatch/-/picomatch-2.2.2.tgz";
        sha1 = "21f333e9b6b8eaff02468f5146ea406d345f4dad";
      };
    }
    {
      name = "pify___pify_3.0.0.tgz";
      path = fetchurl {
        name = "pify___pify_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/pify/-/pify-3.0.0.tgz";
        sha1 = "e5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176";
      };
    }
    {
      name = "pify___pify_4.0.1.tgz";
      path = fetchurl {
        name = "pify___pify_4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/pify/-/pify-4.0.1.tgz";
        sha1 = "4b2cd25c50d598735c50292224fd8c6df41e3231";
      };
    }
    {
      name = "pkg_dir___pkg_dir_3.0.0.tgz";
      path = fetchurl {
        name = "pkg_dir___pkg_dir_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-3.0.0.tgz";
        sha1 = "2749020f239ed990881b1f71210d51eb6523bea3";
      };
    }
    {
      name = "pkg_dir___pkg_dir_4.2.0.tgz";
      path = fetchurl {
        name = "pkg_dir___pkg_dir_4.2.0.tgz";
        url  = "https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz";
        sha1 = "f099133df7ede422e81d1d8448270eeb3e4261f3";
      };
    }
    {
      name = "posix_character_classes___posix_character_classes_0.1.1.tgz";
      path = fetchurl {
        name = "posix_character_classes___posix_character_classes_0.1.1.tgz";
        url  = "https://registry.yarnpkg.com/posix-character-classes/-/posix-character-classes-0.1.1.tgz";
        sha1 = "01eac0fe3b5af71a2a6c02feabb8c1fef7e00eab";
      };
    }
    {
      name = "pretty_error___pretty_error_2.1.1.tgz";
      path = fetchurl {
        name = "pretty_error___pretty_error_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/pretty-error/-/pretty-error-2.1.1.tgz";
        sha1 = "5f4f87c8f91e5ae3f3ba87ab4cf5e03b1a17f1a3";
      };
    }
    {
      name = "process_nextick_args___process_nextick_args_2.0.1.tgz";
      path = fetchurl {
        name = "process_nextick_args___process_nextick_args_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz";
        sha1 = "7820d9b16120cc55ca9ae7792680ae7dba6d7fe2";
      };
    }
    {
      name = "process___process_0.11.10.tgz";
      path = fetchurl {
        name = "process___process_0.11.10.tgz";
        url  = "https://registry.yarnpkg.com/process/-/process-0.11.10.tgz";
        sha1 = "7332300e840161bda3e69a1d1d91a7d4bc16f182";
      };
    }
    {
      name = "promise_inflight___promise_inflight_1.0.1.tgz";
      path = fetchurl {
        name = "promise_inflight___promise_inflight_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz";
        sha1 = "98472870bf228132fcbdd868129bad12c3c029e3";
      };
    }
    {
      name = "prop_types___prop_types_15.7.2.tgz";
      path = fetchurl {
        name = "prop_types___prop_types_15.7.2.tgz";
        url  = "https://registry.yarnpkg.com/prop-types/-/prop-types-15.7.2.tgz";
        sha1 = "52c41e75b8c87e72b9d9360e0206b99dcbffa6c5";
      };
    }
    {
      name = "prr___prr_1.0.1.tgz";
      path = fetchurl {
        name = "prr___prr_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/prr/-/prr-1.0.1.tgz";
        sha1 = "d3fc114ba06995a45ec6893f484ceb1d78f5f476";
      };
    }
    {
      name = "public_encrypt___public_encrypt_4.0.3.tgz";
      path = fetchurl {
        name = "public_encrypt___public_encrypt_4.0.3.tgz";
        url  = "https://registry.yarnpkg.com/public-encrypt/-/public-encrypt-4.0.3.tgz";
        sha1 = "4fcc9d77a07e48ba7527e7cbe0de33d0701331e0";
      };
    }
    {
      name = "pump___pump_2.0.1.tgz";
      path = fetchurl {
        name = "pump___pump_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/pump/-/pump-2.0.1.tgz";
        sha1 = "12399add6e4cf7526d973cbc8b5ce2e2908b3909";
      };
    }
    {
      name = "pump___pump_3.0.0.tgz";
      path = fetchurl {
        name = "pump___pump_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz";
        sha1 = "b4a2116815bde2f4e1ea602354e8c75565107a64";
      };
    }
    {
      name = "pumpify___pumpify_1.5.1.tgz";
      path = fetchurl {
        name = "pumpify___pumpify_1.5.1.tgz";
        url  = "https://registry.yarnpkg.com/pumpify/-/pumpify-1.5.1.tgz";
        sha1 = "36513be246ab27570b1a374a5ce278bfd74370ce";
      };
    }
    {
      name = "punycode___punycode_1.3.2.tgz";
      path = fetchurl {
        name = "punycode___punycode_1.3.2.tgz";
        url  = "https://registry.yarnpkg.com/punycode/-/punycode-1.3.2.tgz";
        sha1 = "9653a036fb7c1ee42342f2325cceefea3926c48d";
      };
    }
    {
      name = "punycode___punycode_1.4.1.tgz";
      path = fetchurl {
        name = "punycode___punycode_1.4.1.tgz";
        url  = "https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz";
        sha1 = "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e";
      };
    }
    {
      name = "punycode___punycode_2.1.1.tgz";
      path = fetchurl {
        name = "punycode___punycode_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/punycode/-/punycode-2.1.1.tgz";
        sha1 = "b58b010ac40c22c5657616c8d2c2c02c7bf479ec";
      };
    }
    {
      name = "querystring_es3___querystring_es3_0.2.1.tgz";
      path = fetchurl {
        name = "querystring_es3___querystring_es3_0.2.1.tgz";
        url  = "https://registry.yarnpkg.com/querystring-es3/-/querystring-es3-0.2.1.tgz";
        sha1 = "9ec61f79049875707d69414596fd907a4d711e73";
      };
    }
    {
      name = "querystring___querystring_0.2.0.tgz";
      path = fetchurl {
        name = "querystring___querystring_0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/querystring/-/querystring-0.2.0.tgz";
        sha1 = "b209849203bb25df820da756e747005878521620";
      };
    }
    {
      name = "randombytes___randombytes_2.1.0.tgz";
      path = fetchurl {
        name = "randombytes___randombytes_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz";
        sha1 = "df6f84372f0270dc65cdf6291349ab7a473d4f2a";
      };
    }
    {
      name = "randomfill___randomfill_1.0.4.tgz";
      path = fetchurl {
        name = "randomfill___randomfill_1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/randomfill/-/randomfill-1.0.4.tgz";
        sha1 = "c92196fc86ab42be983f1bf31778224931d61458";
      };
    }
    {
      name = "rc___rc_1.2.8.tgz";
      path = fetchurl {
        name = "rc___rc_1.2.8.tgz";
        url  = "https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz";
        sha1 = "cd924bf5200a075b83c188cd6b9e211b7fc0d3ed";
      };
    }
    {
      name = "react_accessible_accordion___react_accessible_accordion_3.0.1.tgz";
      path = fetchurl {
        name = "react_accessible_accordion___react_accessible_accordion_3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/react-accessible-accordion/-/react-accessible-accordion-3.0.1.tgz";
        sha1 = "8f3b08c712f4d5e526fad4c55c3d70fc3b68cbd5";
      };
    }
    {
      name = "react_dom___react_dom_16.13.1.tgz";
      path = fetchurl {
        name = "react_dom___react_dom_16.13.1.tgz";
        url  = "https://registry.yarnpkg.com/react-dom/-/react-dom-16.13.1.tgz";
        sha1 = "c1bd37331a0486c078ee54c4740720993b2e0e7f";
      };
    }
    {
      name = "react_force_graph_2d___react_force_graph_2d_1.15.2.tgz";
      path = fetchurl {
        name = "react_force_graph_2d___react_force_graph_2d_1.15.2.tgz";
        url  = "https://registry.yarnpkg.com/react-force-graph-2d/-/react-force-graph-2d-1.15.2.tgz";
        sha1 = "f4bcdb1388d68c5db8b4e42c9b44ac1388aa0633";
      };
    }
    {
      name = "react_is___react_is_16.13.1.tgz";
      path = fetchurl {
        name = "react_is___react_is_16.13.1.tgz";
        url  = "https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz";
        sha1 = "789729a4dc36de2999dc156dd6c1d9c18cea56a4";
      };
    }
    {
      name = "react_kapsule___react_kapsule_2.1.8.tgz";
      path = fetchurl {
        name = "react_kapsule___react_kapsule_2.1.8.tgz";
        url  = "https://registry.yarnpkg.com/react-kapsule/-/react-kapsule-2.1.8.tgz";
        sha1 = "8c68a0277f836ff8623ad1ca1304196e14c9a645";
      };
    }
    {
      name = "react_simple_resizer___react_simple_resizer_2.1.0.tgz";
      path = fetchurl {
        name = "react_simple_resizer___react_simple_resizer_2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/react-simple-resizer/-/react-simple-resizer-2.1.0.tgz";
        sha1 = "9645d2bc2f1ee043435804619826cad0bf2511d7";
      };
    }
    {
      name = "react___react_16.13.1.tgz";
      path = fetchurl {
        name = "react___react_16.13.1.tgz";
        url  = "https://registry.yarnpkg.com/react/-/react-16.13.1.tgz";
        sha1 = "2e818822f1a9743122c063d6410d85c1e3afe48e";
      };
    }
    {
      name = "readable_stream___readable_stream_2.3.7.tgz";
      path = fetchurl {
        name = "readable_stream___readable_stream_2.3.7.tgz";
        url  = "https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.7.tgz";
        sha1 = "1eca1cf711aef814c04f62252a36a62f6cb23b57";
      };
    }
    {
      name = "readable_stream___readable_stream_3.6.0.tgz";
      path = fetchurl {
        name = "readable_stream___readable_stream_3.6.0.tgz";
        url  = "https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.0.tgz";
        sha1 = "337bbda3adc0706bd3e024426a286d4b4b2c9198";
      };
    }
    {
      name = "readdirp___readdirp_2.2.1.tgz";
      path = fetchurl {
        name = "readdirp___readdirp_2.2.1.tgz";
        url  = "https://registry.yarnpkg.com/readdirp/-/readdirp-2.2.1.tgz";
        sha1 = "0e87622a3325aa33e892285caf8b4e846529a525";
      };
    }
    {
      name = "regex_not___regex_not_1.0.2.tgz";
      path = fetchurl {
        name = "regex_not___regex_not_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/regex-not/-/regex-not-1.0.2.tgz";
        sha1 = "1f4ece27e00b0b65e0247a6810e6a85d83a5752c";
      };
    }
    {
      name = "relateurl___relateurl_0.2.7.tgz";
      path = fetchurl {
        name = "relateurl___relateurl_0.2.7.tgz";
        url  = "https://registry.yarnpkg.com/relateurl/-/relateurl-0.2.7.tgz";
        sha1 = "54dbf377e51440aca90a4cd274600d3ff2d888a9";
      };
    }
    {
      name = "remove_trailing_separator___remove_trailing_separator_1.1.0.tgz";
      path = fetchurl {
        name = "remove_trailing_separator___remove_trailing_separator_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz";
        sha1 = "c24bce2a283adad5bc3f58e0d48249b92379d8ef";
      };
    }
    {
      name = "renderkid___renderkid_2.0.3.tgz";
      path = fetchurl {
        name = "renderkid___renderkid_2.0.3.tgz";
        url  = "https://registry.yarnpkg.com/renderkid/-/renderkid-2.0.3.tgz";
        sha1 = "380179c2ff5ae1365c522bf2fcfcff01c5b74149";
      };
    }
    {
      name = "repeat_element___repeat_element_1.1.3.tgz";
      path = fetchurl {
        name = "repeat_element___repeat_element_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/repeat-element/-/repeat-element-1.1.3.tgz";
        sha1 = "782e0d825c0c5a3bb39731f84efee6b742e6b1ce";
      };
    }
    {
      name = "repeat_string___repeat_string_1.6.1.tgz";
      path = fetchurl {
        name = "repeat_string___repeat_string_1.6.1.tgz";
        url  = "https://registry.yarnpkg.com/repeat-string/-/repeat-string-1.6.1.tgz";
        sha1 = "8dcae470e1c88abc2d600fff4a776286da75e637";
      };
    }
    {
      name = "require_directory___require_directory_2.1.1.tgz";
      path = fetchurl {
        name = "require_directory___require_directory_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz";
        sha1 = "8c64ad5fd30dab1c976e2344ffe7f792a6a6df42";
      };
    }
    {
      name = "require_main_filename___require_main_filename_2.0.0.tgz";
      path = fetchurl {
        name = "require_main_filename___require_main_filename_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-2.0.0.tgz";
        sha1 = "d0b329ecc7cc0f61649f62215be69af54aa8989b";
      };
    }
    {
      name = "resolve_cwd___resolve_cwd_2.0.0.tgz";
      path = fetchurl {
        name = "resolve_cwd___resolve_cwd_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-2.0.0.tgz";
        sha1 = "00a9f7387556e27038eae232caa372a6a59b665a";
      };
    }
    {
      name = "resolve_dir___resolve_dir_1.0.1.tgz";
      path = fetchurl {
        name = "resolve_dir___resolve_dir_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/resolve-dir/-/resolve-dir-1.0.1.tgz";
        sha1 = "79a40644c362be82f26effe739c9bb5382046f43";
      };
    }
    {
      name = "resolve_from___resolve_from_3.0.0.tgz";
      path = fetchurl {
        name = "resolve_from___resolve_from_3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/resolve-from/-/resolve-from-3.0.0.tgz";
        sha1 = "b22c7af7d9d6881bc8b6e653335eebcb0a188748";
      };
    }
    {
      name = "resolve_url___resolve_url_0.2.1.tgz";
      path = fetchurl {
        name = "resolve_url___resolve_url_0.2.1.tgz";
        url  = "https://registry.yarnpkg.com/resolve-url/-/resolve-url-0.2.1.tgz";
        sha1 = "2c637fe77c893afd2a663fe21aa9080068e2052a";
      };
    }
    {
      name = "resolve___resolve_1.16.1.tgz";
      path = fetchurl {
        name = "resolve___resolve_1.16.1.tgz";
        url  = "https://registry.yarnpkg.com/resolve/-/resolve-1.16.1.tgz";
        sha1 = "49fac5d8bacf1fd53f200fa51247ae736175832c";
      };
    }
    {
      name = "ret___ret_0.1.15.tgz";
      path = fetchurl {
        name = "ret___ret_0.1.15.tgz";
        url  = "https://registry.yarnpkg.com/ret/-/ret-0.1.15.tgz";
        sha1 = "b8a4825d5bdb1fc3f6f53c2bc33f81388681c7bc";
      };
    }
    {
      name = "rimraf___rimraf_2.7.1.tgz";
      path = fetchurl {
        name = "rimraf___rimraf_2.7.1.tgz";
        url  = "https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz";
        sha1 = "35797f13a7fdadc566142c29d4f07ccad483e3ec";
      };
    }
    {
      name = "ripemd160___ripemd160_2.0.2.tgz";
      path = fetchurl {
        name = "ripemd160___ripemd160_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.2.tgz";
        sha1 = "a1c1a6f624751577ba5d07914cbc92850585890c";
      };
    }
    {
      name = "run_queue___run_queue_1.0.3.tgz";
      path = fetchurl {
        name = "run_queue___run_queue_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/run-queue/-/run-queue-1.0.3.tgz";
        sha1 = "e848396f057d223f24386924618e25694161ec47";
      };
    }
    {
      name = "rw___rw_1.3.3.tgz";
      path = fetchurl {
        name = "rw___rw_1.3.3.tgz";
        url  = "https://registry.yarnpkg.com/rw/-/rw-1.3.3.tgz";
        sha1 = "3f862dfa91ab766b14885ef4d01124bfda074fb4";
      };
    }
    {
      name = "rxjs___rxjs_6.5.5.tgz";
      path = fetchurl {
        name = "rxjs___rxjs_6.5.5.tgz";
        url  = "https://registry.yarnpkg.com/rxjs/-/rxjs-6.5.5.tgz";
        sha1 = "c5c884e3094c8cfee31bf27eb87e54ccfc87f9ec";
      };
    }
    {
      name = "safe_buffer___safe_buffer_5.1.2.tgz";
      path = fetchurl {
        name = "safe_buffer___safe_buffer_5.1.2.tgz";
        url  = "https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz";
        sha1 = "991ec69d296e0313747d59bdfd2b745c35f8828d";
      };
    }
    {
      name = "safe_regex___safe_regex_1.1.0.tgz";
      path = fetchurl {
        name = "safe_regex___safe_regex_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/safe-regex/-/safe-regex-1.1.0.tgz";
        sha1 = "40a3669f3b077d1e943d44629e157dd48023bf2e";
      };
    }
    {
      name = "safer_buffer___safer_buffer_2.1.2.tgz";
      path = fetchurl {
        name = "safer_buffer___safer_buffer_2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha1 = "44fa161b0187b9549dd84bb91802f9bd8385cd6a";
      };
    }
    {
      name = "sax___sax_1.2.4.tgz";
      path = fetchurl {
        name = "sax___sax_1.2.4.tgz";
        url  = "https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz";
        sha1 = "2816234e2378bddc4e5354fab5caa895df7100d9";
      };
    }
    {
      name = "scheduler___scheduler_0.19.1.tgz";
      path = fetchurl {
        name = "scheduler___scheduler_0.19.1.tgz";
        url  = "https://registry.yarnpkg.com/scheduler/-/scheduler-0.19.1.tgz";
        sha1 = "4f3e2ed2c1a7d65681f4c854fa8c5a1ccb40f196";
      };
    }
    {
      name = "schema_utils___schema_utils_0.4.7.tgz";
      path = fetchurl {
        name = "schema_utils___schema_utils_0.4.7.tgz";
        url  = "https://registry.yarnpkg.com/schema-utils/-/schema-utils-0.4.7.tgz";
        sha1 = "ba74f597d2be2ea880131746ee17d0a093c68187";
      };
    }
    {
      name = "schema_utils___schema_utils_1.0.0.tgz";
      path = fetchurl {
        name = "schema_utils___schema_utils_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/schema-utils/-/schema-utils-1.0.0.tgz";
        sha1 = "0b79a93204d7b600d4b2850d1f66c2a34951c770";
      };
    }
    {
      name = "schema_utils___schema_utils_2.6.6.tgz";
      path = fetchurl {
        name = "schema_utils___schema_utils_2.6.6.tgz";
        url  = "https://registry.yarnpkg.com/schema-utils/-/schema-utils-2.6.6.tgz";
        sha1 = "299fe6bd4a3365dc23d99fd446caff8f1d6c330c";
      };
    }
    {
      name = "seedrandom___seedrandom_3.0.5.tgz";
      path = fetchurl {
        name = "seedrandom___seedrandom_3.0.5.tgz";
        url  = "https://registry.yarnpkg.com/seedrandom/-/seedrandom-3.0.5.tgz";
        sha1 = "54edc85c95222525b0c7a6f6b3543d8e0b3aa0a7";
      };
    }
    {
      name = "semver___semver_5.7.1.tgz";
      path = fetchurl {
        name = "semver___semver_5.7.1.tgz";
        url  = "https://registry.yarnpkg.com/semver/-/semver-5.7.1.tgz";
        sha1 = "a954f931aeba508d307bbf069eff0c01c96116f7";
      };
    }
    {
      name = "semver___semver_6.3.0.tgz";
      path = fetchurl {
        name = "semver___semver_6.3.0.tgz";
        url  = "https://registry.yarnpkg.com/semver/-/semver-6.3.0.tgz";
        sha1 = "ee0a64c8af5e8ceea67687b133761e1becbd1d3d";
      };
    }
    {
      name = "serialize_javascript___serialize_javascript_1.9.1.tgz";
      path = fetchurl {
        name = "serialize_javascript___serialize_javascript_1.9.1.tgz";
        url  = "https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-1.9.1.tgz";
        sha1 = "cfc200aef77b600c47da9bb8149c943e798c2fdb";
      };
    }
    {
      name = "serialize_javascript___serialize_javascript_2.1.2.tgz";
      path = fetchurl {
        name = "serialize_javascript___serialize_javascript_2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-2.1.2.tgz";
        sha1 = "ecec53b0e0317bdc95ef76ab7074b7384785fa61";
      };
    }
    {
      name = "set_blocking___set_blocking_2.0.0.tgz";
      path = fetchurl {
        name = "set_blocking___set_blocking_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz";
        sha1 = "045f9782d011ae9a6803ddd382b24392b3d890f7";
      };
    }
    {
      name = "set_value___set_value_2.0.1.tgz";
      path = fetchurl {
        name = "set_value___set_value_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/set-value/-/set-value-2.0.1.tgz";
        sha1 = "a18d40530e6f07de4228c7defe4227af8cad005b";
      };
    }
    {
      name = "setimmediate___setimmediate_1.0.5.tgz";
      path = fetchurl {
        name = "setimmediate___setimmediate_1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz";
        sha1 = "290cbb232e306942d7d7ea9b83732ab7856f8285";
      };
    }
    {
      name = "sha.js___sha.js_2.4.11.tgz";
      path = fetchurl {
        name = "sha.js___sha.js_2.4.11.tgz";
        url  = "https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.11.tgz";
        sha1 = "37a5cf0b81ecbc6943de109ba2960d1b26584ae7";
      };
    }
    {
      name = "shebang_command___shebang_command_1.2.0.tgz";
      path = fetchurl {
        name = "shebang_command___shebang_command_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/shebang-command/-/shebang-command-1.2.0.tgz";
        sha1 = "44aac65b695b03398968c39f363fee5deafdf1ea";
      };
    }
    {
      name = "shebang_regex___shebang_regex_1.0.0.tgz";
      path = fetchurl {
        name = "shebang_regex___shebang_regex_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-1.0.0.tgz";
        sha1 = "da42f49740c0b42db2ca9728571cb190c98efea3";
      };
    }
    {
      name = "showdown___showdown_1.9.1.tgz";
      path = fetchurl {
        name = "showdown___showdown_1.9.1.tgz";
        url  = "https://registry.yarnpkg.com/showdown/-/showdown-1.9.1.tgz";
        sha1 = "134e148e75cd4623e09c21b0511977d79b5ad0ef";
      };
    }
    {
      name = "signal_exit___signal_exit_3.0.2.tgz";
      path = fetchurl {
        name = "signal_exit___signal_exit_3.0.2.tgz";
        url  = "https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.2.tgz";
        sha1 = "b5fdc08f1287ea1178628e415e25132b73646c6d";
      };
    }
    {
      name = "slash___slash_1.0.0.tgz";
      path = fetchurl {
        name = "slash___slash_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/slash/-/slash-1.0.0.tgz";
        sha1 = "c41f2f6c39fc16d1cd17ad4b5d896114ae470d55";
      };
    }
    {
      name = "snapdragon_node___snapdragon_node_2.1.1.tgz";
      path = fetchurl {
        name = "snapdragon_node___snapdragon_node_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/snapdragon-node/-/snapdragon-node-2.1.1.tgz";
        sha1 = "6c175f86ff14bdb0724563e8f3c1b021a286853b";
      };
    }
    {
      name = "snapdragon_util___snapdragon_util_3.0.1.tgz";
      path = fetchurl {
        name = "snapdragon_util___snapdragon_util_3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/snapdragon-util/-/snapdragon-util-3.0.1.tgz";
        sha1 = "f956479486f2acd79700693f6f7b805e45ab56e2";
      };
    }
    {
      name = "snapdragon___snapdragon_0.8.2.tgz";
      path = fetchurl {
        name = "snapdragon___snapdragon_0.8.2.tgz";
        url  = "https://registry.yarnpkg.com/snapdragon/-/snapdragon-0.8.2.tgz";
        sha1 = "64922e7c565b0e14204ba1aa7d6964278d25182d";
      };
    }
    {
      name = "source_list_map___source_list_map_2.0.1.tgz";
      path = fetchurl {
        name = "source_list_map___source_list_map_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/source-list-map/-/source-list-map-2.0.1.tgz";
        sha1 = "3993bd873bfc48479cca9ea3a547835c7c154b34";
      };
    }
    {
      name = "source_map_resolve___source_map_resolve_0.5.3.tgz";
      path = fetchurl {
        name = "source_map_resolve___source_map_resolve_0.5.3.tgz";
        url  = "https://registry.yarnpkg.com/source-map-resolve/-/source-map-resolve-0.5.3.tgz";
        sha1 = "190866bece7553e1f8f267a2ee82c606b5509a1a";
      };
    }
    {
      name = "source_map_support___source_map_support_0.5.16.tgz";
      path = fetchurl {
        name = "source_map_support___source_map_support_0.5.16.tgz";
        url  = "https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.16.tgz";
        sha1 = "0ae069e7fe3ba7538c64c98515e35339eac5a042";
      };
    }
    {
      name = "source_map_url___source_map_url_0.4.0.tgz";
      path = fetchurl {
        name = "source_map_url___source_map_url_0.4.0.tgz";
        url  = "https://registry.yarnpkg.com/source-map-url/-/source-map-url-0.4.0.tgz";
        sha1 = "3e935d7ddd73631b97659956d55128e87b5084a3";
      };
    }
    {
      name = "source_map___source_map_0.5.7.tgz";
      path = fetchurl {
        name = "source_map___source_map_0.5.7.tgz";
        url  = "https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz";
        sha1 = "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc";
      };
    }
    {
      name = "source_map___source_map_0.6.1.tgz";
      path = fetchurl {
        name = "source_map___source_map_0.6.1.tgz";
        url  = "https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz";
        sha1 = "74722af32e9614e9c287a8d0bbde48b5e2f1a263";
      };
    }
    {
      name = "split_string___split_string_3.1.0.tgz";
      path = fetchurl {
        name = "split_string___split_string_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/split-string/-/split-string-3.1.0.tgz";
        sha1 = "7cb09dda3a86585705c64b39a6466038682e8fe2";
      };
    }
    {
      name = "sprintf_js___sprintf_js_1.0.3.tgz";
      path = fetchurl {
        name = "sprintf_js___sprintf_js_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz";
        sha1 = "04e6926f662895354f3dd015203633b857297e2c";
      };
    }
    {
      name = "ssri___ssri_6.0.1.tgz";
      path = fetchurl {
        name = "ssri___ssri_6.0.1.tgz";
        url  = "https://registry.yarnpkg.com/ssri/-/ssri-6.0.1.tgz";
        sha1 = "2a3c41b28dd45b62b63676ecb74001265ae9edd8";
      };
    }
    {
      name = "ssri___ssri_7.1.0.tgz";
      path = fetchurl {
        name = "ssri___ssri_7.1.0.tgz";
        url  = "https://registry.yarnpkg.com/ssri/-/ssri-7.1.0.tgz";
        sha1 = "92c241bf6de82365b5c7fb4bd76e975522e1294d";
      };
    }
    {
      name = "static_extend___static_extend_0.1.2.tgz";
      path = fetchurl {
        name = "static_extend___static_extend_0.1.2.tgz";
        url  = "https://registry.yarnpkg.com/static-extend/-/static-extend-0.1.2.tgz";
        sha1 = "60809c39cbff55337226fd5e0b520f341f1fb5c6";
      };
    }
    {
      name = "stream_browserify___stream_browserify_2.0.2.tgz";
      path = fetchurl {
        name = "stream_browserify___stream_browserify_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/stream-browserify/-/stream-browserify-2.0.2.tgz";
        sha1 = "87521d38a44aa7ee91ce1cd2a47df0cb49dd660b";
      };
    }
    {
      name = "stream_each___stream_each_1.2.3.tgz";
      path = fetchurl {
        name = "stream_each___stream_each_1.2.3.tgz";
        url  = "https://registry.yarnpkg.com/stream-each/-/stream-each-1.2.3.tgz";
        sha1 = "ebe27a0c389b04fbcc233642952e10731afa9bae";
      };
    }
    {
      name = "stream_http___stream_http_2.8.3.tgz";
      path = fetchurl {
        name = "stream_http___stream_http_2.8.3.tgz";
        url  = "https://registry.yarnpkg.com/stream-http/-/stream-http-2.8.3.tgz";
        sha1 = "b2d242469288a5a27ec4fe8933acf623de6514fc";
      };
    }
    {
      name = "stream_shift___stream_shift_1.0.1.tgz";
      path = fetchurl {
        name = "stream_shift___stream_shift_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/stream-shift/-/stream-shift-1.0.1.tgz";
        sha1 = "d7088281559ab2778424279b0877da3c392d5a3d";
      };
    }
    {
      name = "string_width___string_width_1.0.2.tgz";
      path = fetchurl {
        name = "string_width___string_width_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz";
        sha1 = "118bdf5b8cdc51a2a7e70d211e07e2b0b9b107d3";
      };
    }
    {
      name = "string_width___string_width_3.1.0.tgz";
      path = fetchurl {
        name = "string_width___string_width_3.1.0.tgz";
        url  = "https://registry.yarnpkg.com/string-width/-/string-width-3.1.0.tgz";
        sha1 = "22767be21b62af1081574306f69ac51b62203961";
      };
    }
    {
      name = "string.prototype.trimend___string.prototype.trimend_1.0.1.tgz";
      path = fetchurl {
        name = "string.prototype.trimend___string.prototype.trimend_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.1.tgz";
        sha1 = "85812a6b847ac002270f5808146064c995fb6913";
      };
    }
    {
      name = "string.prototype.trimleft___string.prototype.trimleft_2.1.2.tgz";
      path = fetchurl {
        name = "string.prototype.trimleft___string.prototype.trimleft_2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/string.prototype.trimleft/-/string.prototype.trimleft-2.1.2.tgz";
        sha1 = "4408aa2e5d6ddd0c9a80739b087fbc067c03b3cc";
      };
    }
    {
      name = "string.prototype.trimright___string.prototype.trimright_2.1.2.tgz";
      path = fetchurl {
        name = "string.prototype.trimright___string.prototype.trimright_2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/string.prototype.trimright/-/string.prototype.trimright-2.1.2.tgz";
        sha1 = "c76f1cef30f21bbad8afeb8db1511496cfb0f2a3";
      };
    }
    {
      name = "string.prototype.trimstart___string.prototype.trimstart_1.0.1.tgz";
      path = fetchurl {
        name = "string.prototype.trimstart___string.prototype.trimstart_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.1.tgz";
        sha1 = "14af6d9f34b053f7cfc89b72f8f2ee14b9039a54";
      };
    }
    {
      name = "string_decoder___string_decoder_1.1.1.tgz";
      path = fetchurl {
        name = "string_decoder___string_decoder_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz";
        sha1 = "9cf1611ba62685d7030ae9e4ba34149c3af03fc8";
      };
    }
    {
      name = "strip_ansi___strip_ansi_3.0.1.tgz";
      path = fetchurl {
        name = "strip_ansi___strip_ansi_3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz";
        sha1 = "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf";
      };
    }
    {
      name = "strip_ansi___strip_ansi_5.2.0.tgz";
      path = fetchurl {
        name = "strip_ansi___strip_ansi_5.2.0.tgz";
        url  = "https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-5.2.0.tgz";
        sha1 = "8c9a536feb6afc962bdfa5b104a5091c1ad9c0ae";
      };
    }
    {
      name = "strip_eof___strip_eof_1.0.0.tgz";
      path = fetchurl {
        name = "strip_eof___strip_eof_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/strip-eof/-/strip-eof-1.0.0.tgz";
        sha1 = "bb43ff5598a6eb05d89b59fcd129c983313606bf";
      };
    }
    {
      name = "strip_json_comments___strip_json_comments_2.0.1.tgz";
      path = fetchurl {
        name = "strip_json_comments___strip_json_comments_2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz";
        sha1 = "3c531942e908c2697c0ec344858c286c7ca0a60a";
      };
    }
    {
      name = "supports_color___supports_color_6.1.0.tgz";
      path = fetchurl {
        name = "supports_color___supports_color_6.1.0.tgz";
        url  = "https://registry.yarnpkg.com/supports-color/-/supports-color-6.1.0.tgz";
        sha1 = "0764abc69c63d5ac842dd4867e8d025e880df8f3";
      };
    }
    {
      name = "supports_color___supports_color_5.5.0.tgz";
      path = fetchurl {
        name = "supports_color___supports_color_5.5.0.tgz";
        url  = "https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz";
        sha1 = "e2e69a44ac8772f78a1ec0b35b689df6530efc8f";
      };
    }
    {
      name = "supports_color___supports_color_7.1.0.tgz";
      path = fetchurl {
        name = "supports_color___supports_color_7.1.0.tgz";
        url  = "https://registry.yarnpkg.com/supports-color/-/supports-color-7.1.0.tgz";
        sha1 = "68e32591df73e25ad1c4b49108a2ec507962bfd1";
      };
    }
    {
      name = "tapable___tapable_1.1.3.tgz";
      path = fetchurl {
        name = "tapable___tapable_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/tapable/-/tapable-1.1.3.tgz";
        sha1 = "a1fccc06b58db61fd7a45da2da44f5f3a3e67ba2";
      };
    }
    {
      name = "tar___tar_4.4.13.tgz";
      path = fetchurl {
        name = "tar___tar_4.4.13.tgz";
        url  = "https://registry.yarnpkg.com/tar/-/tar-4.4.13.tgz";
        sha1 = "43b364bc52888d555298637b10d60790254ab525";
      };
    }
    {
      name = "terser_webpack_plugin_legacy___terser_webpack_plugin_legacy_1.2.3.tgz";
      path = fetchurl {
        name = "terser_webpack_plugin_legacy___terser_webpack_plugin_legacy_1.2.3.tgz";
        url  = "https://registry.yarnpkg.com/terser-webpack-plugin-legacy/-/terser-webpack-plugin-legacy-1.2.3.tgz";
        sha1 = "d438d3a0a8d03138090f899bc274e79de5f67a79";
      };
    }
    {
      name = "terser_webpack_plugin___terser_webpack_plugin_1.4.3.tgz";
      path = fetchurl {
        name = "terser_webpack_plugin___terser_webpack_plugin_1.4.3.tgz";
        url  = "https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-1.4.3.tgz";
        sha1 = "5ecaf2dbdc5fb99745fd06791f46fc9ddb1c9a7c";
      };
    }
    {
      name = "terser_webpack_plugin___terser_webpack_plugin_2.3.5.tgz";
      path = fetchurl {
        name = "terser_webpack_plugin___terser_webpack_plugin_2.3.5.tgz";
        url  = "https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-2.3.5.tgz";
        sha1 = "5ad971acce5c517440ba873ea4f09687de2f4a81";
      };
    }
    {
      name = "terser___terser_3.17.0.tgz";
      path = fetchurl {
        name = "terser___terser_3.17.0.tgz";
        url  = "https://registry.yarnpkg.com/terser/-/terser-3.17.0.tgz";
        sha1 = "f88ffbeda0deb5637f9d24b0da66f4e15ab10cb2";
      };
    }
    {
      name = "terser___terser_4.6.11.tgz";
      path = fetchurl {
        name = "terser___terser_4.6.11.tgz";
        url  = "https://registry.yarnpkg.com/terser/-/terser-4.6.11.tgz";
        sha1 = "12ff99fdd62a26de2a82f508515407eb6ccd8a9f";
      };
    }
    {
      name = "through2___through2_2.0.5.tgz";
      path = fetchurl {
        name = "through2___through2_2.0.5.tgz";
        url  = "https://registry.yarnpkg.com/through2/-/through2-2.0.5.tgz";
        sha1 = "01c1e39eb31d07cb7d03a96a70823260b23132cd";
      };
    }
    {
      name = "timers_browserify___timers_browserify_2.0.11.tgz";
      path = fetchurl {
        name = "timers_browserify___timers_browserify_2.0.11.tgz";
        url  = "https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-2.0.11.tgz";
        sha1 = "800b1f3eee272e5bc53ee465a04d0e804c31211f";
      };
    }
    {
      name = "tinycolor2___tinycolor2_1.4.1.tgz";
      path = fetchurl {
        name = "tinycolor2___tinycolor2_1.4.1.tgz";
        url  = "https://registry.yarnpkg.com/tinycolor2/-/tinycolor2-1.4.1.tgz";
        sha1 = "f4fad333447bc0b07d4dc8e9209d8f39a8ac77e8";
      };
    }
    {
      name = "to_arraybuffer___to_arraybuffer_1.0.1.tgz";
      path = fetchurl {
        name = "to_arraybuffer___to_arraybuffer_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/to-arraybuffer/-/to-arraybuffer-1.0.1.tgz";
        sha1 = "7d229b1fcc637e466ca081180836a7aabff83f43";
      };
    }
    {
      name = "to_object_path___to_object_path_0.3.0.tgz";
      path = fetchurl {
        name = "to_object_path___to_object_path_0.3.0.tgz";
        url  = "https://registry.yarnpkg.com/to-object-path/-/to-object-path-0.3.0.tgz";
        sha1 = "297588b7b0e7e0ac08e04e672f85c1f4999e17af";
      };
    }
    {
      name = "to_regex_range___to_regex_range_2.1.1.tgz";
      path = fetchurl {
        name = "to_regex_range___to_regex_range_2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-2.1.1.tgz";
        sha1 = "7c80c17b9dfebe599e27367e0d4dd5590141db38";
      };
    }
    {
      name = "to_regex_range___to_regex_range_5.0.1.tgz";
      path = fetchurl {
        name = "to_regex_range___to_regex_range_5.0.1.tgz";
        url  = "https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz";
        sha1 = "1648c44aae7c8d988a326018ed72f5b4dd0392e4";
      };
    }
    {
      name = "to_regex___to_regex_3.0.2.tgz";
      path = fetchurl {
        name = "to_regex___to_regex_3.0.2.tgz";
        url  = "https://registry.yarnpkg.com/to-regex/-/to-regex-3.0.2.tgz";
        sha1 = "13cfdd9b336552f30b51f33a8ae1b42a7a7599ce";
      };
    }
    {
      name = "toposort___toposort_1.0.7.tgz";
      path = fetchurl {
        name = "toposort___toposort_1.0.7.tgz";
        url  = "https://registry.yarnpkg.com/toposort/-/toposort-1.0.7.tgz";
        sha1 = "2e68442d9f64ec720b8cc89e6443ac6caa950029";
      };
    }
    {
      name = "ts_loader___ts_loader_6.2.2.tgz";
      path = fetchurl {
        name = "ts_loader___ts_loader_6.2.2.tgz";
        url  = "https://registry.yarnpkg.com/ts-loader/-/ts-loader-6.2.2.tgz";
        sha1 = "dffa3879b01a1a1e0a4b85e2b8421dc0dfff1c58";
      };
    }
    {
      name = "tslib___tslib_1.11.1.tgz";
      path = fetchurl {
        name = "tslib___tslib_1.11.1.tgz";
        url  = "https://registry.yarnpkg.com/tslib/-/tslib-1.11.1.tgz";
        sha1 = "eb15d128827fbee2841549e171f45ed338ac7e35";
      };
    }
    {
      name = "tslint___tslint_5.20.1.tgz";
      path = fetchurl {
        name = "tslint___tslint_5.20.1.tgz";
        url  = "https://registry.yarnpkg.com/tslint/-/tslint-5.20.1.tgz";
        sha1 = "e401e8aeda0152bc44dd07e614034f3f80c67b7d";
      };
    }
    {
      name = "tsutils___tsutils_2.29.0.tgz";
      path = fetchurl {
        name = "tsutils___tsutils_2.29.0.tgz";
        url  = "https://registry.yarnpkg.com/tsutils/-/tsutils-2.29.0.tgz";
        sha1 = "32b488501467acbedd4b85498673a0812aca0b99";
      };
    }
    {
      name = "tty_browserify___tty_browserify_0.0.0.tgz";
      path = fetchurl {
        name = "tty_browserify___tty_browserify_0.0.0.tgz";
        url  = "https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.0.tgz";
        sha1 = "a157ba402da24e9bf957f9aa69d524eed42901a6";
      };
    }
    {
      name = "typedarray___typedarray_0.0.6.tgz";
      path = fetchurl {
        name = "typedarray___typedarray_0.0.6.tgz";
        url  = "https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz";
        sha1 = "867ac74e3864187b1d3d47d996a78ec5c8830777";
      };
    }
    {
      name = "typescript___typescript_3.8.3.tgz";
      path = fetchurl {
        name = "typescript___typescript_3.8.3.tgz";
        url  = "https://registry.yarnpkg.com/typescript/-/typescript-3.8.3.tgz";
        sha1 = "409eb8544ea0335711205869ec458ab109ee1061";
      };
    }
    {
      name = "uglify_js___uglify_js_3.4.10.tgz";
      path = fetchurl {
        name = "uglify_js___uglify_js_3.4.10.tgz";
        url  = "https://registry.yarnpkg.com/uglify-js/-/uglify-js-3.4.10.tgz";
        sha1 = "9ad9563d8eb3acdfb8d38597d2af1d815f6a755f";
      };
    }
    {
      name = "union_value___union_value_1.0.1.tgz";
      path = fetchurl {
        name = "union_value___union_value_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/union-value/-/union-value-1.0.1.tgz";
        sha1 = "0b6fe7b835aecda61c6ea4d4f02c14221e109847";
      };
    }
    {
      name = "unique_filename___unique_filename_1.1.1.tgz";
      path = fetchurl {
        name = "unique_filename___unique_filename_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/unique-filename/-/unique-filename-1.1.1.tgz";
        sha1 = "1d69769369ada0583103a1e6ae87681b56573230";
      };
    }
    {
      name = "unique_slug___unique_slug_2.0.2.tgz";
      path = fetchurl {
        name = "unique_slug___unique_slug_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/unique-slug/-/unique-slug-2.0.2.tgz";
        sha1 = "baabce91083fc64e945b0f3ad613e264f7cd4e6c";
      };
    }
    {
      name = "unset_value___unset_value_1.0.0.tgz";
      path = fetchurl {
        name = "unset_value___unset_value_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/unset-value/-/unset-value-1.0.0.tgz";
        sha1 = "8376873f7d2335179ffb1e6fc3a8ed0dfc8ab559";
      };
    }
    {
      name = "upath___upath_1.2.0.tgz";
      path = fetchurl {
        name = "upath___upath_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/upath/-/upath-1.2.0.tgz";
        sha1 = "8f66dbcd55a883acdae4408af8b035a5044c1894";
      };
    }
    {
      name = "upper_case___upper_case_1.1.3.tgz";
      path = fetchurl {
        name = "upper_case___upper_case_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/upper-case/-/upper-case-1.1.3.tgz";
        sha1 = "f6b4501c2ec4cdd26ba78be7222961de77621598";
      };
    }
    {
      name = "uri_js___uri_js_4.2.2.tgz";
      path = fetchurl {
        name = "uri_js___uri_js_4.2.2.tgz";
        url  = "https://registry.yarnpkg.com/uri-js/-/uri-js-4.2.2.tgz";
        sha1 = "94c540e1ff772956e2299507c010aea6c8838eb0";
      };
    }
    {
      name = "urix___urix_0.1.0.tgz";
      path = fetchurl {
        name = "urix___urix_0.1.0.tgz";
        url  = "https://registry.yarnpkg.com/urix/-/urix-0.1.0.tgz";
        sha1 = "da937f7a62e21fec1fd18d49b35c2935067a6c72";
      };
    }
    {
      name = "url___url_0.11.0.tgz";
      path = fetchurl {
        name = "url___url_0.11.0.tgz";
        url  = "https://registry.yarnpkg.com/url/-/url-0.11.0.tgz";
        sha1 = "3838e97cfc60521eb73c525a8e55bfdd9e2e28f1";
      };
    }
    {
      name = "use___use_3.1.1.tgz";
      path = fetchurl {
        name = "use___use_3.1.1.tgz";
        url  = "https://registry.yarnpkg.com/use/-/use-3.1.1.tgz";
        sha1 = "d50c8cac79a19fbc20f2911f56eb973f4e10070f";
      };
    }
    {
      name = "util_deprecate___util_deprecate_1.0.2.tgz";
      path = fetchurl {
        name = "util_deprecate___util_deprecate_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz";
        sha1 = "450d4dc9fa70de732762fbd2d4a28981419a0ccf";
      };
    }
    {
      name = "util.promisify___util.promisify_1.0.0.tgz";
      path = fetchurl {
        name = "util.promisify___util.promisify_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.0.tgz";
        sha1 = "440f7165a459c9a16dc145eb8e72f35687097030";
      };
    }
    {
      name = "util___util_0.10.3.tgz";
      path = fetchurl {
        name = "util___util_0.10.3.tgz";
        url  = "https://registry.yarnpkg.com/util/-/util-0.10.3.tgz";
        sha1 = "7afb1afe50805246489e3db7fe0ed379336ac0f9";
      };
    }
    {
      name = "util___util_0.11.1.tgz";
      path = fetchurl {
        name = "util___util_0.11.1.tgz";
        url  = "https://registry.yarnpkg.com/util/-/util-0.11.1.tgz";
        sha1 = "3236733720ec64bb27f6e26f421aaa2e1b588d61";
      };
    }
    {
      name = "utila___utila_0.4.0.tgz";
      path = fetchurl {
        name = "utila___utila_0.4.0.tgz";
        url  = "https://registry.yarnpkg.com/utila/-/utila-0.4.0.tgz";
        sha1 = "8a16a05d445657a3aea5eecc5b12a4fa5379772c";
      };
    }
    {
      name = "uuid___uuid_3.4.0.tgz";
      path = fetchurl {
        name = "uuid___uuid_3.4.0.tgz";
        url  = "https://registry.yarnpkg.com/uuid/-/uuid-3.4.0.tgz";
        sha1 = "b23e4358afa8a202fe7a100af1f5f883f02007ee";
      };
    }
    {
      name = "v8_compile_cache___v8_compile_cache_2.0.3.tgz";
      path = fetchurl {
        name = "v8_compile_cache___v8_compile_cache_2.0.3.tgz";
        url  = "https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.0.3.tgz";
        sha1 = "00f7494d2ae2b688cfe2899df6ed2c54bef91dbe";
      };
    }
    {
      name = "vm_browserify___vm_browserify_1.1.2.tgz";
      path = fetchurl {
        name = "vm_browserify___vm_browserify_1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/vm-browserify/-/vm-browserify-1.1.2.tgz";
        sha1 = "78641c488b8e6ca91a75f511e7a3b32a86e5dda0";
      };
    }
    {
      name = "watchpack___watchpack_1.6.1.tgz";
      path = fetchurl {
        name = "watchpack___watchpack_1.6.1.tgz";
        url  = "https://registry.yarnpkg.com/watchpack/-/watchpack-1.6.1.tgz";
        sha1 = "280da0a8718592174010c078c7585a74cd8cd0e2";
      };
    }
    {
      name = "webpack_cli___webpack_cli_3.3.11.tgz";
      path = fetchurl {
        name = "webpack_cli___webpack_cli_3.3.11.tgz";
        url  = "https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-3.3.11.tgz";
        sha1 = "3bf21889bf597b5d82c38f215135a411edfdc631";
      };
    }
    {
      name = "webpack_log___webpack_log_2.0.0.tgz";
      path = fetchurl {
        name = "webpack_log___webpack_log_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/webpack-log/-/webpack-log-2.0.0.tgz";
        sha1 = "5b7928e0637593f119d32f6227c1e0ac31e1b47f";
      };
    }
    {
      name = "webpack_sources___webpack_sources_1.4.3.tgz";
      path = fetchurl {
        name = "webpack_sources___webpack_sources_1.4.3.tgz";
        url  = "https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-1.4.3.tgz";
        sha1 = "eedd8ec0b928fbf1cbfe994e22d2d890f330a933";
      };
    }
    {
      name = "webpack___webpack_4.42.1.tgz";
      path = fetchurl {
        name = "webpack___webpack_4.42.1.tgz";
        url  = "https://registry.yarnpkg.com/webpack/-/webpack-4.42.1.tgz";
        sha1 = "ae707baf091f5ca3ef9c38b884287cfe8f1983ef";
      };
    }
    {
      name = "which_module___which_module_2.0.0.tgz";
      path = fetchurl {
        name = "which_module___which_module_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/which-module/-/which-module-2.0.0.tgz";
        sha1 = "d9ef07dce77b9902b8a3a8fa4b31c3e3f7e6e87a";
      };
    }
    {
      name = "which___which_1.3.1.tgz";
      path = fetchurl {
        name = "which___which_1.3.1.tgz";
        url  = "https://registry.yarnpkg.com/which/-/which-1.3.1.tgz";
        sha1 = "a45043d54f5805316da8d62f9f50918d3da70b0a";
      };
    }
    {
      name = "wide_align___wide_align_1.1.3.tgz";
      path = fetchurl {
        name = "wide_align___wide_align_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.3.tgz";
        sha1 = "ae074e6bdc0c14a431e804e624549c633b000457";
      };
    }
    {
      name = "worker_farm___worker_farm_1.7.0.tgz";
      path = fetchurl {
        name = "worker_farm___worker_farm_1.7.0.tgz";
        url  = "https://registry.yarnpkg.com/worker-farm/-/worker-farm-1.7.0.tgz";
        sha1 = "26a94c5391bbca926152002f69b84a4bf772e5a8";
      };
    }
    {
      name = "worker_loader___worker_loader_2.0.0.tgz";
      path = fetchurl {
        name = "worker_loader___worker_loader_2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/worker-loader/-/worker-loader-2.0.0.tgz";
        sha1 = "45fda3ef76aca815771a89107399ee4119b430ac";
      };
    }
    {
      name = "wrap_ansi___wrap_ansi_5.1.0.tgz";
      path = fetchurl {
        name = "wrap_ansi___wrap_ansi_5.1.0.tgz";
        url  = "https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-5.1.0.tgz";
        sha1 = "1fd1f67235d5b6d0fee781056001bfb694c03b09";
      };
    }
    {
      name = "wrappy___wrappy_1.0.2.tgz";
      path = fetchurl {
        name = "wrappy___wrappy_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    }
    {
      name = "xtend___xtend_4.0.2.tgz";
      path = fetchurl {
        name = "xtend___xtend_4.0.2.tgz";
        url  = "https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz";
        sha1 = "bb72779f5fa465186b1f438f674fa347fdb5db54";
      };
    }
    {
      name = "y18n___y18n_4.0.0.tgz";
      path = fetchurl {
        name = "y18n___y18n_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/y18n/-/y18n-4.0.0.tgz";
        sha1 = "95ef94f85ecc81d007c264e190a120f0a3c8566b";
      };
    }
    {
      name = "yallist___yallist_3.1.1.tgz";
      path = fetchurl {
        name = "yallist___yallist_3.1.1.tgz";
        url  = "https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz";
        sha1 = "dbb7daf9bfd8bac9ab45ebf602b8cbad0d5d08fd";
      };
    }
    {
      name = "yallist___yallist_4.0.0.tgz";
      path = fetchurl {
        name = "yallist___yallist_4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz";
        sha1 = "9bb92790d9c0effec63be73519e11a35019a3a72";
      };
    }
    {
      name = "yargs_parser___yargs_parser_13.1.2.tgz";
      path = fetchurl {
        name = "yargs_parser___yargs_parser_13.1.2.tgz";
        url  = "https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-13.1.2.tgz";
        sha1 = "130f09702ebaeef2650d54ce6e3e5706f7a4fb38";
      };
    }
    {
      name = "yargs_parser___yargs_parser_15.0.1.tgz";
      path = fetchurl {
        name = "yargs_parser___yargs_parser_15.0.1.tgz";
        url  = "https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-15.0.1.tgz";
        sha1 = "54786af40b820dcb2fb8025b11b4d659d76323b3";
      };
    }
    {
      name = "yargs___yargs_13.2.4.tgz";
      path = fetchurl {
        name = "yargs___yargs_13.2.4.tgz";
        url  = "https://registry.yarnpkg.com/yargs/-/yargs-13.2.4.tgz";
        sha1 = "0b562b794016eb9651b98bd37acf364aa5d6dc83";
      };
    }
    {
      name = "yargs___yargs_14.2.3.tgz";
      path = fetchurl {
        name = "yargs___yargs_14.2.3.tgz";
        url  = "https://registry.yarnpkg.com/yargs/-/yargs-14.2.3.tgz";
        sha1 = "1a1c3edced1afb2a2fea33604bc6d1d8d688a414";
      };
    }
  ];
}
