--local prefix = "#tool."..debug.getinfo( 1, "S" ).source:match(".+[/?\\?](.+)%.lua").."."

local prefix = "#tool.weight_improved."

localify.Bind( "en",    prefix.."language_en",    "English" )
localify.Bind( "pt-br", prefix.."language_pt-br", "Português do Brasil" )
localify.Bind( "sv-se", prefix.."language_sv-se", "Svenska" )
localify.Bind( "ja",    prefix.."language_ja",    "日本語" )
localify.Bind( "zh-cn", prefix.."language_zh-cn",    "简体中文" )
localify.Bind( "nl",    prefix.."language_nl",    "Nederlandse" )
localify.Bind( "pl",    prefix.."language_pl",    "Polskie" )
localify.Bind( "de",    prefix.."language_de",    "Deutsch" )
localify.Bind( "es",    prefix.."language_es",    "Español" )
localify.Bind( "da",    prefix.."language_da",    "Dansk" )
localify.Bind( "bg",    prefix.."language_bg",    "Български" )
localify.Bind( "ru",    prefix.."language_ru",    "русский" )
localify.Bind( "ko",    prefix.."language_ko",    "한국어" )
localify.Bind( "fr",    prefix.."language_fr",    "Français" )
localify.Bind( "et",    prefix.."language_et",    "Eesti" )
localify.Bind( "th",    prefix.."language_th",    "ไทย" )

--[[--------------------------------------------------------------------------
-- English Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "en", prefix.."name",                     "Weight - Improved" )
localify.Bind( "en", prefix.."desc",                     "Modifies the weight of an entity" )
localify.Bind( "en", prefix.."left",                     "Apply weight" )
localify.Bind( "en", prefix.."right",                    "Copy weight" )
localify.Bind( "en", prefix.."reload",                   "Reset weight" )
-- Errors
localify.Bind( "en", prefix.."error_zero_weight",        "You must apply a weight greater than 0" )
localify.Bind( "en", prefix.."error_invalid_phys",       "This entity does not have a valid physics object (cannot modify weight)" )
localify.Bind( "en", prefix.."error_max_weight",         "Weight cannot exceed max" )
-- Labels
localify.Bind( "en", prefix.."label_colorscale",         "Color Scale: " )
localify.Bind( "en", prefix.."label_weight",             "Weight: " )
localify.Bind( "en", prefix.."label_decimals",           "Decimal Places: " )
localify.Bind( "en", prefix.."label_tooltip_scale",      "Tooltip Scale: " )
localify.Bind( "en", prefix.."label_language",           "Language: " )
localify.Bind( "en", prefix.."label_credits",            "" )
-- Checkboxes
localify.Bind( "en", prefix.."checkbox_round",           "Display rounded weights in tooltip" )
localify.Bind( "en", prefix.."checkbox_tooltip_show",    "Always show tooltip" )
localify.Bind( "en", prefix.."checkbox_tooltip_legacy",  "Use legacy tooltip" )
localify.Bind( "en", prefix.."checkbox_notifs",          "Display notifications" )
localify.Bind( "en", prefix.."checkbox_notifs_sound",    "Play notification sounds" )
-- Comboboxes
localify.Bind( "en", prefix.."combobox_green_to_red",    "Green to Red" )
localify.Bind( "en", prefix.."combobox_green_to_yellow", "Green to Yellow" )
localify.Bind( "en", prefix.."combobox_green_to_blue",   "Green to Blue" )
localify.Bind( "en", prefix.."combobox_blue_to_red",     "Blue to Red" )
localify.Bind( "en", prefix.."combobox_none",            "None" )
localify.Bind( "en", prefix.."combobox_default",         "Default" )
-- Descriptions
localify.Bind( "en", prefix.."help_colorscale",          "Adds a halo around the target entity with a color representing its current weight. The colors go from minimum to maximum respectively." )
localify.Bind( "en", prefix.."help_decimals",            "Determines how many decimal places the weights should be rounded to when displaying them in the HUD. Zero means whole numbers are displayed." )
localify.Bind( "en", prefix.."help_tooltip_show",        "Shows the tooltip even when the weight tool is not being used." )
localify.Bind( "en", prefix.."help_tooltip_scale",       "Sets the size of the tooltip when drawing the HUD." )
localify.Bind( "en", prefix.."help_tooltip_legacy",      "Enables a slightly modified tooltip used in older versions of Garry's Mod." )
localify.Bind( "en", prefix.."help_notifs",              "Enables helpful notifications when applying, copying, or resetting an entity's weight." )
localify.Bind( "en", prefix.."help_notifs_sound",        "Enables the notification sound when applying weight to an entity." )
-- HUD Text
localify.Bind( "en", prefix.."hud_original",             "Original" )
localify.Bind( "en", prefix.."hud_modified",             "Modified" )
-- Notifications
localify.Bind( "en", prefix.."notif_applied",            "Applied weight" )
localify.Bind( "en", prefix.."notif_copied",             "Copied weight" )
localify.Bind( "en", prefix.."notif_restored",           "Restored original weight" )

--[[--------------------------------------------------------------------------
-- Brazilian Portuguese Localization
-- Big thanks to Sommer (STEAM_0:0:57791547) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "pt-br", prefix.."name",                     "Peso - Melhorado" )
localify.Bind( "pt-br", prefix.."desc",                     "Modifica a massa de uma entidade" )
localify.Bind( "pt-br", prefix.."left",                     "Aplicar massa" )
localify.Bind( "pt-br", prefix.."right",                    "Copiar massa" )
localify.Bind( "pt-br", prefix.."reload",                   "Restaurar massa" )
-- Errors
localify.Bind( "pt-br", prefix.."error_zero_weight",        "Você deve aplicar um peso maior que 0" )
localify.Bind( "pt-br", prefix.."error_invalid_phys",       "Esta entidade não possui um objeto físico válido. (Não é possível modificar a massa)" )
localify.Bind( "pt-br", prefix.."error_max_weight",         "O peso não pode exceder o máximo" )
-- Labels
localify.Bind( "pt-br", prefix.."label_colorscale",         "Escala de Cores: " )
localify.Bind( "pt-br", prefix.."label_weight",             "Peso: " )
localify.Bind( "pt-br", prefix.."label_decimals",           "Casas Decimais: " )
localify.Bind( "pt-br", prefix.."label_tooltip_scale",      "Tamanho da Tooltip: " )
localify.Bind( "pt-br", prefix.."label_language",           "Idioma: " )
localify.Bind( "pt-br", prefix.."label_credits",            "Tradução Português do Brasil por Sommer (STEAM_0:0:57791547)" )
-- Checkboxes
localify.Bind( "pt-br", prefix.."checkbox_round",           "Mostrar massa arredondada na tooltip" )
localify.Bind( "pt-br", prefix.."checkbox_tooltip_show",    "Sempre mostrar a tooltip" )
localify.Bind( "pt-br", prefix.."checkbox_tooltip_legacy",  "Usar tooltip padrão" )
localify.Bind( "pt-br", prefix.."checkbox_notifs",          "Mostrar notificações" )
localify.Bind( "pt-br", prefix.."checkbox_notifs_sound",    "Tocar sons de notificações" )
-- Comboboxes
localify.Bind( "pt-br", prefix.."combobox_green_to_red",    "Verde para Vermelho" )
localify.Bind( "pt-br", prefix.."combobox_green_to_yellow", "Verde para Amarelo" )
localify.Bind( "pt-br", prefix.."combobox_green_to_blue",   "Verde para Azul" )
localify.Bind( "pt-br", prefix.."combobox_blue_to_red",     "Azul para Vermelho" )
localify.Bind( "pt-br", prefix.."combobox_none",            "Nenhum" )
localify.Bind( "pt-br", prefix.."combobox_default",         "Padrão" )
-- Descriptions
localify.Bind( "pt-br", prefix.."help_colorscale",          "Adiciona uma áurea em volta do alvo com uma cor representando sua massa atual. As cores vão de mínima para máxima, respectivamente." )
localify.Bind( "pt-br", prefix.."help_decimals",            "Determina quantas casas decimais a massa deve ser arredondada quando mostradas no HUD. Zero significa que números inteiros serão mostrados." )
localify.Bind( "pt-br", prefix.."help_tooltip_scale",       "Define o tamanho da tooltip ao desenhar o HUD." )
localify.Bind( "pt-br", prefix.."help_tooltip_show",        "Mostra a tooltip mesmo quando a ferramenta peso não está sendo usada." )
localify.Bind( "pt-br", prefix.."help_tooltip_legacy",      "Aciona uma tooltip levemente modificada usada em versões antigas de Garry's Mod." )
localify.Bind( "pt-br", prefix.."help_notifs",              "Aciona notificações úteis ao aplicar, copiar ou restaurar o peso de uma entidade." )
localify.Bind( "pt-br", prefix.."help_notifs_sound",        "Aciona o som da notificação ao aplicar o peso à uma entidade." )
-- HUD Text
localify.Bind( "pt-br", prefix.."hud_original",             "Original" )
localify.Bind( "pt-br", prefix.."hud_modified",             "Modificado" )
-- Notifications
localify.Bind( "pt-br", prefix.."notif_applied",            "Peso aplicado" )
localify.Bind( "pt-br", prefix.."notif_copied",             "Peso copiado" )
localify.Bind( "pt-br", prefix.."notif_restored",           "Peso original restaurado" )

--[[--------------------------------------------------------------------------
-- Swedish Localization
-- Big thanks to Christian (STEAM_0:0:36373825) and Jeff (STEAM_0:0:25982100) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "sv-se", prefix.."name",                     "Viktverktyg - Förbättrad" )
localify.Bind( "sv-se", prefix.."desc",                     "Modifierar vikten av en enhet" )
localify.Bind( "sv-se", prefix.."left",                     "Applicera vikt" )
localify.Bind( "sv-se", prefix.."right",                    "Kopiera vikt" )
localify.Bind( "sv-se", prefix.."reload",                   "Återställ vikt" )
-- Errors
localify.Bind( "sv-se", prefix.."error_zero_weight",        "Du måste applicera en vikt större än 0" )
localify.Bind( "sv-se", prefix.."error_invalid_phys",       "Den här enheten har ej ett giltigt fysik objekt (Kan ej ändra vikt)" )
localify.Bind( "sv-se", prefix.."error_max_weight",         "Vikten kan ej gå över max" )
-- Labels
localify.Bind( "sv-se", prefix.."label_colorscale",         "Färg Skala: " )
localify.Bind( "sv-se", prefix.."label_weight",             "Vikt: " )
localify.Bind( "sv-se", prefix.."label_decimals",           "Värdesiffror: " )
localify.Bind( "sv-se", prefix.."label_tooltip_scale",      "Verktygstips Skala: " )
localify.Bind( "sv-se", prefix.."label_language",           "Språk: " )
localify.Bind( "sv-se", prefix.."label_credits",            "Svensk översättning av Christian (STEAM_0:0:36373825) och Jeff (STEAM_0:0:25982100)" )
-- Checkboxes
localify.Bind( "sv-se", prefix.."checkbox_round",           "Visa avrundade vikter inom verktygstips" )
localify.Bind( "sv-se", prefix.."checkbox_tooltip_show",    "Visa alltid verktygstips" )
localify.Bind( "sv-se", prefix.."checkbox_tooltip_legacy",  "Använd gamla verktygstips" )
localify.Bind( "sv-se", prefix.."checkbox_notifs",          "Visa notifikationer" )
localify.Bind( "sv-se", prefix.."checkbox_notifs_sound",    "Spela notifikationsljud" )
-- Comboboxes
localify.Bind( "sv-se", prefix.."combobox_green_to_red",    "Grön till Röd" )
localify.Bind( "sv-se", prefix.."combobox_green_to_yellow", "Grön till Gul" )
localify.Bind( "sv-se", prefix.."combobox_green_to_blue",   "Grön till Blå" )
localify.Bind( "sv-se", prefix.."combobox_blue_to_red",     "Blå till Röd" )
localify.Bind( "sv-se", prefix.."combobox_none",            "Inget" )
localify.Bind( "sv-se", prefix.."combobox_default",         "Standard" )
-- Descriptions
localify.Bind( "sv-se", prefix.."help_colorscale",          "Adderar en färgkontur runt målenheten som indikerar dess nuvarande vikt. Färgen går från minimum till maximalt respektive." )
localify.Bind( "sv-se", prefix.."help_decimals",            "Bestämmer antalet värdesiffor som vikten avrundas till när framförda inom HUD. Noll innebär att värderna är avrundade till heltal." )
localify.Bind( "sv-se", prefix.."help_tooltip_show",        "Visar verktygstips även när vikt verktyget inte används." )
localify.Bind( "sv-se", prefix.."help_tooltip_scale",       "Bestämmer storleken av verktygstips när HUD:en genereras." )
localify.Bind( "sv-se", prefix.."help_tooltip_legacy",      "Tillåt en något modifierad verktygstips använd i äldre versioner av Garry's Mod." )
localify.Bind( "sv-se", prefix.."help_notifs",              "Tillåt hjälpsamma notifikationer vid applicering, kopiering, eller återställning av enhetens vikt." )
localify.Bind( "sv-se", prefix.."help_notifs_sound",        "Tillåt notifikationsljuden när vikt appliceras till en enhet." )
-- HUD Text
localify.Bind( "sv-se", prefix.."hud_original",             "Orginal" )
localify.Bind( "sv-se", prefix.."hud_modified",             "Modifierad" )
-- Notifications
localify.Bind( "sv-se", prefix.."notif_applied",            "Applicerad vikt" )
localify.Bind( "sv-se", prefix.."notif_copied",             "Kopierad Vikt" )
localify.Bind( "sv-se", prefix.."notif_restored",           "Återställ orginal vikt" )

--[[--------------------------------------------------------------------------
-- Japanese Localization
-- Big thanks to daigennki/seihai (STEAM_0:1:43031440) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "ja", prefix.."name",                     "重量 - 改良版" )
localify.Bind( "ja", prefix.."desc",                     "エンティティの重量を変更します" )
localify.Bind( "ja", prefix.."left",                     "重量を適用する" )
localify.Bind( "ja", prefix.."right",                    "重量をコピーする " )
localify.Bind( "ja", prefix.."reload",                   "重量をリセットする" )

-- Errors
localify.Bind( "ja", prefix.."error_zero_weight",        "適用される重量は0より大きい必要があります" )
localify.Bind( "ja", prefix.."error_invalid_phys",       "このエンティティには有効な物理オブジェクトが存在しません（重量は変更できません）" )
localify.Bind( "ja", prefix.."error_max_weight",         "重量は最大値を超えられません" )
-- Labels
localify.Bind( "ja", prefix.."label_colorscale",         "カラースケール: " )
localify.Bind( "ja", prefix.."label_weight",             "重量: " )
localify.Bind( "ja", prefix.."label_decimals",           "小数点: " )
localify.Bind( "ja", prefix.."label_tooltip_scale",      "ツールチップの大きさ: " )
localify.Bind( "ja", prefix.."label_language",           "言語: " )
localify.Bind( "ja", prefix.."label_credits",            "daigennki (STEAM_0:1:43031440)による日本語訳" )
-- Checkboxes
localify.Bind( "ja", prefix.."checkbox_round",           "ツールチップの重量表示を丸める" )
localify.Bind( "ja", prefix.."checkbox_tooltip_show",    "常にツールチップを表示する" )
localify.Bind( "ja", prefix.."checkbox_tooltip_legacy",  "レガシーツールチップを使用する" )
localify.Bind( "ja", prefix.."checkbox_notifs",          "通知を表示する" )
localify.Bind( "ja", prefix.."checkbox_notifs_sound",    "通知音を再生する" )
-- Comboboxes
localify.Bind( "ja", prefix.."combobox_green_to_red",    "緑から赤" )
localify.Bind( "ja", prefix.."combobox_green_to_yellow", "緑から黄色" )
localify.Bind( "ja", prefix.."combobox_green_to_blue",   "緑から青" )
localify.Bind( "ja", prefix.."combobox_blue_to_red",     "青から赤" )
localify.Bind( "ja", prefix.."combobox_none",            "なし" )
localify.Bind( "ja", prefix.."combobox_default",         "既定" )
-- Descriptions
localify.Bind( "ja", prefix.."help_colorscale",          "エンティティの現在の重量を表す色のハローをエンティティの周りに表示します。色はそれぞれ最小から最大までを表します。" )
localify.Bind( "ja", prefix.."help_decimals",            "HUDで重量が表示される時の小数点の最下位を設定します。0に設定された場合、最後まで表示されます。" )
localify.Bind( "ja", prefix.."help_tooltip_show",        "重量ツールが使用されていなくてもツールチップが表示されます。" )
localify.Bind( "ja", prefix.."help_tooltip_scale",       "HUDが描画されている時のツールチップの大きさを設定します。" )
localify.Bind( "ja", prefix.."help_tooltip_legacy",      "GarrysModの古いバージョンで使用されていたツールチップを有効にします。" )
localify.Bind( "ja", prefix.."help_notifs",              "エンティティの重量が適用、コピー、またはリセットされた時に通知が表示されます。" )
localify.Bind( "ja", prefix.."help_notifs_sound",        "エンティティの重量が適用された時に通知音が再生されます。" )
-- HUD Text
localify.Bind( "ja", prefix.."hud_original",             "既定" )
localify.Bind( "ja", prefix.."hud_modified",             "変更版" )
-- Notifications
localify.Bind( "ja", prefix.."notif_applied",            "重量が適用されました" )
localify.Bind( "ja", prefix.."notif_copied",             "重量がコピーされました" )
localify.Bind( "ja", prefix.."notif_restored",           "元の重量に戻されました" )

--[[--------------------------------------------------------------------------
-- Dutch Localization
-- Big thanks to Bunny (STEAM_0:1:34698490) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "nl", prefix.."name",                     "Gewicht - Verbeterd" )
localify.Bind( "nl", prefix.."desc",                     "Verandert het gewicht van een object" )
localify.Bind( "nl", prefix.."left",                     "Pas gewicht toe" )
localify.Bind( "nl", prefix.."right",                    "Kopieer gewicht" )
localify.Bind( "nl", prefix.."reload",                   "Reset gewicht" )
-- Errors
localify.Bind( "nl", prefix.."error_zero_weight",        "Je moet een gewicht toepassen dat meer weegt dan 0" )
localify.Bind( "nl", prefix.."error_invalid_phys",       "Je kan het gewicht van dit object niet veranderen" )
localify.Bind( "nl", prefix.."error_max_weight",         "Gewicht kan het maximale niet overschrijden" )
-- Labels
localify.Bind( "nl", prefix.."label_colorscale",         "Kleuren Selectie: " )
localify.Bind( "nl", prefix.."label_weight",             "Gewicht: " )
localify.Bind( "nl", prefix.."label_decimals",           "Decimalen Mogelijkheden: " )
localify.Bind( "nl", prefix.."label_tooltip_scale",      "Tooltip Grote: " )
localify.Bind( "nl", prefix.."label_language",           "Taal: " )
localify.Bind( "nl", prefix.."label_credits",            "Nederlandse vertaling door Bunny (STEAM_0:1:34698490)" )
-- Checkboxes
localify.Bind( "nl", prefix.."checkbox_round",           "Laat afgeronde gewichten zien in de tooltip" )
localify.Bind( "nl", prefix.."checkbox_tooltip_show",    "Laat tooltip altijd zien" )
localify.Bind( "nl", prefix.."checkbox_tooltip_legacy",  "Gebruik de oude tooltip" )
localify.Bind( "nl", prefix.."checkbox_notifs",          "Laat notificaties zien" )
localify.Bind( "nl", prefix.."checkbox_notifs_sound",    "Speel notificatie geluiden" )
-- Comboboxes
localify.Bind( "nl", prefix.."combobox_green_to_red",    "Groen naar Rood" )
localify.Bind( "nl", prefix.."combobox_green_to_yellow", "Groen naar Geel" )
localify.Bind( "nl", prefix.."combobox_green_to_blue",   "Groen naar Blauw" )
localify.Bind( "nl", prefix.."combobox_blue_to_red",     "Blauw naar Rood" )
localify.Bind( "nl", prefix.."combobox_none",            "Geen" )
localify.Bind( "nl", prefix.."combobox_default",         "Standaart" )
-- Descriptions
localify.Bind( "nl", prefix.."help_colorscale",          "Voegt een halo toe rond het object met een kleur die het huidige gewicht weergeeft." )
localify.Bind( "nl", prefix.."help_decimals",            "Bepaalt hoeveel decimalen er zullen worden gebruikt om het gewicht weer te geven in de HUD. Nul betekent dat er alleen ronde getallen worden gebruikt." )
localify.Bind( "nl", prefix.."help_tooltip_show",        "Laat de tooltip zien zelfs als de weight tool niet word gebruikt." )
localify.Bind( "nl", prefix.."help_tooltip_scale",       "Bepaalt de grote van de tooltip in de HUD." )
localify.Bind( "nl", prefix.."help_tooltip_legacy",      "Verandert de tooltip HUD die werd gebruikt in oudere versies van Garry’s Mod." )
localify.Bind( "nl", prefix.."help_notifs",              "Geeft handige notificaties weer wanneer je een gewicht, kopieert, reset of toepast." )
localify.Bind( "nl", prefix.."help_notifs_sound",        "Maakt een notificatie geluid wanneer je een gewicht toepast." )
-- HUD Text
localify.Bind( "nl", prefix.."hud_original",             "Origineel" )
localify.Bind( "nl", prefix.."hud_modified",             "Toegepast" )
-- Notifications
localify.Bind( "nl", prefix.."notif_applied",            "Gewicht toegepast" )
localify.Bind( "nl", prefix.."notif_copied",             "Gewicht gekopieerd" )
localify.Bind( "nl", prefix.."notif_restored",           "Originele gewicht terug gezet" )

--[[--------------------------------------------------------------------------
-- Polish Localization
-- Big thanks to Sarian (STEAM_0:0:34104920) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "pl", prefix.."name",                     "Ciężar - Ulepszony" )
localify.Bind( "pl", prefix.."desc",                     "Zmienia ciężar obiektu" )
localify.Bind( "pl", prefix.."left",                     "Zastosuj ciężar" )
localify.Bind( "pl", prefix.."right",                    "Skopiuj ciężar" )
localify.Bind( "pl", prefix.."reload",                   "Zresetuj ciężar" )
-- Errors
localify.Bind( "pl", prefix.."error_zero_weight",        "Ciężar musi być większy od 0" )
localify.Bind( "pl", prefix.."error_invalid_phys",       "Ten obiekt nie posiada modelu fizycznego (nie można zmodyfikować  ciężaru)" )
localify.Bind( "pl", prefix.."error_max_weight",         "Ciężar nie może przekraczać maximum" )
-- Labels
localify.Bind( "pl", prefix.."label_colorscale",         "Skala Koloru: " )
localify.Bind( "pl", prefix.."label_weight",             "Ciężar: " )
localify.Bind( "pl", prefix.."label_decimals",           "Miejsca Po Przecinku: " )
localify.Bind( "pl", prefix.."label_tooltip_scale",      "Skala Podpowiedzi: " )
localify.Bind( "pl", prefix.."label_language",           "Język: " )
localify.Bind( "pl", prefix.."label_credits",            "Tłumaczenie polsko przez Sarian (STEAM_0:0:34104920)" )
-- Checkboxes
localify.Bind( "pl", prefix.."checkbox_round",           "Wyświetlaj zaokrąglony ciężar w podpowiedzi" )
localify.Bind( "pl", prefix.."checkbox_tooltip_show",    "Zawsze pokazuj podpowiedź" )
localify.Bind( "pl", prefix.."checkbox_tooltip_legacy",  "Użyj starej skali" )
localify.Bind( "pl", prefix.."checkbox_notifs",          "Wyświetlaj powiadomienia" )
localify.Bind( "pl", prefix.."checkbox_notifs_sound",    "Odtwarzaj dźwięk powiadomienia" )
-- Comboboxes
localify.Bind( "pl", prefix.."combobox_green_to_red",    "Zielony do Czerwonego" )
localify.Bind( "pl", prefix.."combobox_green_to_yellow", "Zielony do żółtego" )
localify.Bind( "pl", prefix.."combobox_green_to_blue",   "Zielony do Niebieskiego" )
localify.Bind( "pl", prefix.."combobox_blue_to_red",     "Niebieski do Czerwonego" )
localify.Bind( "pl", prefix.."combobox_none",            "żaden" )
localify.Bind( "pl", prefix.."combobox_default",         "Domyślny" )
-- Descriptions
localify.Bind( "pl", prefix.."help_colorscale",          "Dodaje poświatę około obiektu z kolorem reprezentującym  jego obecny ciężar. Kolory zmieniają się odpowiednio od minimum do maximum." )
localify.Bind( "pl", prefix.."help_decimals",            "Ustala do ilu miejsc po przecinku ciężar powinien zostać zaokrąglony podczas wyświetlania na ekranie. Zero oznacza pełne liczby." )
localify.Bind( "pl", prefix.."help_tooltip_show",        "Pokaż podpowiedź nawet jeśli narzędzie wagi nie jest używane." )
localify.Bind( "pl", prefix.."help_tooltip_scale",       "Ustawia rozmiar podpowiedzi rysowanej na ekranie." )
localify.Bind( "pl", prefix.."help_tooltip_legacy",      "Włącza lekko zmodyfikowaną podpowiedź używaną w starszych wersjach Garry's Moda" )
localify.Bind( "pl", prefix.."help_notifs",              "Włącza pomocną podpowiedź podczas zastosowywania, kopiowania lub resetowania ciężaru obiektu." )
localify.Bind( "pl", prefix.."help_notifs_sound",        "Włącza powiadomienia dźwiękowe podczas zastosowywania ciężaru do obiektu" )
-- HUD Text
localify.Bind( "pl", prefix.."hud_original",             "Oryginalny" )
localify.Bind( "pl", prefix.."hud_modified",             "Zmodyfikowany" )
-- Notifications
localify.Bind( "pl", prefix.."notif_applied",            "Zastosowano ciężar" )
localify.Bind( "pl", prefix.."notif_copied",             "Skopiowano ciężar" )
localify.Bind( "pl", prefix.."notif_restored",           "Przywrócono oryginalny ciężar" )

--[[--------------------------------------------------------------------------
-- German Localization
-- Big thanks to Time SchocK (STEAM_0:1:12054113) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "de", prefix.."name",                     "Masse - Verbessert" )
localify.Bind( "de", prefix.."desc",                     "Ändert die Masse eines Objekts" )
localify.Bind( "de", prefix.."left",                     "Masse ändern" )
localify.Bind( "de", prefix.."right",                    "Masse kopieren" )
localify.Bind( "de", prefix.."reload",                   "Masse zurücksetzen" )
-- Errors
localify.Bind( "de", prefix.."error_zero_weight",        "Du musst eine Masse größer 0 wählen" )
localify.Bind( "de", prefix.."error_invalid_phys",       "Dieses Objekt hat kein gültiges 'physics object' (Masse kann nicht geändert werden)" )
localify.Bind( "de", prefix.."error_max_weight",         "Masse darf nicht größer als max sein" )
-- Labels
localify.Bind( "de", prefix.."label_colorscale",         "Farbenskalierung:" )
localify.Bind( "de", prefix.."label_weight",             "Masse: " )
localify.Bind( "de", prefix.."label_decimals",           "Dezimalstellen: " )
localify.Bind( "de", prefix.."label_tooltip_scale",      "Tooltipskalierung: " )
localify.Bind( "de", prefix.."label_language",           "Sprache: " )
localify.Bind( "de", prefix.."label_credits",            "Deutsche Übersetzung von Time SchocK (STEAM_0:1:12054113)" )
-- Checkboxes
localify.Bind( "de", prefix.."checkbox_round",           "Gerundete Masse im Tooltip anzeigen" )
localify.Bind( "de", prefix.."checkbox_tooltip_show",    "Tooltip immer anzeigen" )
localify.Bind( "de", prefix.."checkbox_tooltip_legacy",  "Legacy Tooltip benutzen" )
localify.Bind( "de", prefix.."checkbox_notifs",          "Benachrichtigungen anzeigen" )
localify.Bind( "de", prefix.."checkbox_notifs_sound",    "Benachrichtigungssounds" )
-- Comboboxes
localify.Bind( "de", prefix.."combobox_green_to_red",    "Grün nach Rot" )
localify.Bind( "de", prefix.."combobox_green_to_yellow", "Grün nach Gelb" )
localify.Bind( "de", prefix.."combobox_green_to_blue",   "Grün nach Blau" )
localify.Bind( "de", prefix.."combobox_blue_to_red",     "Blau nach Rot" )
localify.Bind( "de", prefix.."combobox_none",            "Keine" )
localify.Bind( "de", prefix.."combobox_default",         "Standard" )
-- Descriptions
localify.Bind( "de", prefix.."help_colorscale",          "Zeigt einen Lichtschein um das gewählte Objekt. Die Farbe des Scheins entspricht der Masse des Objekts. Je schwerer die Masse desto stärker die zweite Farbe und umgekehrt." )
localify.Bind( "de", prefix.."help_decimals",            "Bestimmt auf wie viele Dezimalstellen die Masse im HUD gerundet wird. Bei NULL werden nur ganze Zahlen dargestellt." )
localify.Bind( "de", prefix.."help_tooltip_show",        "Zeigt den Tooltip auch wenn das Tool nicht benutzt wird." )
localify.Bind( "de", prefix.."help_tooltip_scale",       "Bestimmt die Größe des Tooltips" )
localify.Bind( "de", prefix.."help_tooltip_legacy",      "Zeigt einen leicht veränderten Tooltip, der in älteren Versionen von Garry's Mod benutzt wurde" )
localify.Bind( "de", prefix.."help_notifs",              "Zeigt hilfreiche Benachrichtigungen beim Ändern, Kopieren und Zurücksetzen der Masse eines Objekts" )
localify.Bind( "de", prefix.."help_notifs_sound",        "Spielt einen Ton, wenn das Gewicht geändert wird" )
-- HUD Text
localify.Bind( "de", prefix.."hud_original",             "Original" )
localify.Bind( "de", prefix.."hud_modified",             "Geändert" )
-- Notifications
localify.Bind( "de", prefix.."notif_applied",            "Masse verändert" )
localify.Bind( "de", prefix.."notif_copied",             "Masse kopiert" )
localify.Bind( "de", prefix.."notif_restored",           "Masse zurückgesetzt" )

--[[--------------------------------------------------------------------------
-- Spanish Localization
-- Big thanks to IFerPe01 (STEAM_0:0:125631888) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "es", prefix.."name",                     "Peso - Mejorado" )
localify.Bind( "es", prefix.."desc",                     "Modifica el peso de una entidad" )
localify.Bind( "es", prefix.."left",                     "Aplicar peso" )
localify.Bind( "es", prefix.."right",                    "Copiar peso" )
localify.Bind( "es", prefix.."reload",                   "Resetear peso" )
-- Errors
localify.Bind( "es", prefix.."error_zero_weight",        "Debes aplicar un peso mayor a 0" )
localify.Bind( "es", prefix.."error_invalid_phys",       "Esta entidad no tiene físicas de objeto válidas (no se puede modificar el peso)" )
localify.Bind( "es", prefix.."error_max_weight",         "El peso no puede exceder el máximoEl peso no puede exceder el máximo" )
-- Labels
localify.Bind( "es", prefix.."label_colorscale",         "Escala de Color: " )
localify.Bind( "es", prefix.."label_weight",             "Peso: " )
localify.Bind( "es", prefix.."label_decimals",           "Lugares Decimales: " )
localify.Bind( "es", prefix.."label_tooltip_scale",      "Escala de la Información: " )
localify.Bind( "es", prefix.."label_language",           "Lenguaje: " )
localify.Bind( "es", prefix.."label_credits",            "Español traducción por IFerPe01 (STEAM_0:0:125631888)" )
-- Checkboxes
localify.Bind( "es", prefix.."checkbox_round",           "Mostrar pesos redondeados en la información" )
localify.Bind( "es", prefix.."checkbox_tooltip_show",    "Siempre mostrar la información" )
localify.Bind( "es", prefix.."checkbox_tooltip_legacy",  "Usar información legada" )
localify.Bind( "es", prefix.."checkbox_notifs",          "Mostrar notificaciones" )
localify.Bind( "es", prefix.."checkbox_notifs_sound",    "Reproducir sonidos de notificación" )
-- Comboboxes
localify.Bind( "es", prefix.."combobox_green_to_red",    "Verde a Rojo" )
localify.Bind( "es", prefix.."combobox_green_to_yellow", "Verde a Amarillo" )
localify.Bind( "es", prefix.."combobox_green_to_blue",   "Verde a Azul" )
localify.Bind( "es", prefix.."combobox_blue_to_red",     "Azul a Rojo" )
localify.Bind( "es", prefix.."combobox_none",            "Ninguno" )
localify.Bind( "es", prefix.."combobox_default",         "Predefinido" )
-- Descriptions
localify.Bind( "es", prefix.."help_colorscale",          "Añade un halo alrededor de la entidad con un color representando su peso actual. Los colores van de mínimo a máximo respectivamente." )
localify.Bind( "es", prefix.."help_decimals",            "Determina cuántos con lugares decimales el peso debería estar rodeado cuando se muestra en el HUD. Cero significa que todos los números están mostrándose." )
localify.Bind( "es", prefix.."help_tooltip_show",        "Muestra la información incluso cuando la herramienta de peso no está siendo usada." )
localify.Bind( "es", prefix.."help_tooltip_scale",       "Define el tamaño de la información presente en el HUD." )
localify.Bind( "es", prefix.."help_tooltip_legacy",      "Activa una versión levemente modificada de la información en las versiones anteriores de Garry's Mod." )
localify.Bind( "es", prefix.."help_notifs",              "Activa notificaciones útiles cuando aplicas, copias o reseteas el peso de una entidad." )
localify.Bind( "es", prefix.."help_notifs_sound",        "Activa un sonido que notifica cuando se aplica peso a una entidad." )
-- HUD Text
localify.Bind( "es", prefix.."hud_original",             "Original" )
localify.Bind( "es", prefix.."hud_modified",             "Modificado" )
-- Notifications
localify.Bind( "es", prefix.."notif_applied",            "Peso aplicado" )
localify.Bind( "es", prefix.."notif_copied",             "Peso copiado" )
localify.Bind( "es", prefix.."notif_restored",           "Se restauró el peso original" )

--[[--------------------------------------------------------------------------
-- Danish Localization
-- Big thanks to The Outrageous Dane (STEAM_0:0:63184464) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "da", prefix.."name",                     "Vægt - Forbedret" )
localify.Bind( "da", prefix.."desc",                     "Modificerer vægten på en enhed" )
localify.Bind( "da", prefix.."left",                     "Påfør vægt" )
localify.Bind( "da", prefix.."right",                    "Kopier vægt" )
localify.Bind( "da", prefix.."reload",                   "Nulstil vægt" )
-- Errors
localify.Bind( "da", prefix.."error_zero_weight",        "Du skal påføre en vægt på mere end 0" )
localify.Bind( "da", prefix.."error_invalid_phys",       "Denne enhed har ikke et fysisk objekt tildelt (kan ikke modificere vægten)" )
localify.Bind( "da", prefix.."error_max_weight",         "Vægten kan ikke overstige max" )
-- Labels
localify.Bind( "da", prefix.."label_colorscale",         "Farve Skala: " )
localify.Bind( "da", prefix.."label_weight",             "Vægt: " )
localify.Bind( "da", prefix.."label_decimals",           "Antal Decimaler: " )
localify.Bind( "da", prefix.."label_tooltip_scale",      "Tooltip Skala: " )
localify.Bind( "da", prefix.."label_language",           "Sprog: " )
localify.Bind( "da", prefix.."label_credits",            "Dansk oversættelse af The Outrageous Dane (STEAM_0:0:63184464)" )
-- Checkboxes
localify.Bind( "da", prefix.."checkbox_round",           "Vis afrundede vægte i tooltip" )
localify.Bind( "da", prefix.."checkbox_tooltip_show",    "Vis altid tooltip" )
localify.Bind( "da", prefix.."checkbox_tooltip_legacy",  "Brug ældre tooltip" )
localify.Bind( "da", prefix.."checkbox_notifs",          "Vis notifikationer" )
localify.Bind( "da", prefix.."checkbox_notifs_sound",    "Afspil notifikationslyde" )
-- Comboboxes
localify.Bind( "da", prefix.."combobox_green_to_red",    "Grøn til Rød" )
localify.Bind( "da", prefix.."combobox_green_to_yellow", "Grøn til Gul" )
localify.Bind( "da", prefix.."combobox_green_to_blue",   "Grøn til Blå" )
localify.Bind( "da", prefix.."combobox_blue_to_red",     "Blå til Rød" )
localify.Bind( "da", prefix.."combobox_none",            "Ingen" )
localify.Bind( "da", prefix.."combobox_default",         "Standard" )
-- Descriptions
localify.Bind( "da", prefix.."help_colorscale",          "Tilføjer en halo omkring den valgte enhed, med en farve der viser dens aktuelle vægt. Farverne går fra minimum til maximum respektivt." )
localify.Bind( "da", prefix.."help_decimals",            "Bestemmer hvor mange decimaler vægtene vil blive afrundet til når de vises i HUD'en. Der vises hele tal hvis sat til 0." )
localify.Bind( "da", prefix.."help_tooltip_show",        "Viser tooltip selv når vægt værktøjet ikke bliver brugt." )
localify.Bind( "da", prefix.."help_tooltip_scale",       "Sætter størrelsen på tooltip når HUD tegnes." )
localify.Bind( "da", prefix.."help_tooltip_legacy",      "Aktiverer et, en smule modificeret tooltip brugt i ældre versioner af Garry's Mod." )
localify.Bind( "da", prefix.."help_notifs",              "Aktiverer hjælpsomme notifikationer når en enheds vægt påføres, kopieres eller nulstilles." )
localify.Bind( "da", prefix.."help_notifs_sound",        "Aktiverer notifikations lyden når der påføres vægt til en enhed." )
-- HUD Text
localify.Bind( "da", prefix.."hud_original",             "Original" )
localify.Bind( "da", prefix.."hud_modified",             "Modificeret" )
-- Notifications
localify.Bind( "da", prefix.."notif_applied",            "Vægt påført" )
localify.Bind( "da", prefix.."notif_copied",             "Vægt kopieret" )
localify.Bind( "da", prefix.."notif_restored",           "Original vægt gendannet" )

--[[--------------------------------------------------------------------------
-- Bulgarian Localization
-- Big thanks to [BA][Sk$Bh]Trick or treat KID! for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "bg", prefix.."name",                     "Тегло - Подобрено" )
localify.Bind( "bg", prefix.."desc",                     "Модифицира теглото на обектна единица" )
localify.Bind( "bg", prefix.."left",                     "Приложи теглото" )
localify.Bind( "bg", prefix.."right",                    "Копирай теглото" )
localify.Bind( "bg", prefix.."reload",                   "Възстанови теглото" )
-- Errors
localify.Bind( "bg", prefix.."error_zero_weight",        "Трябва да приложите тегло по-голямо от 0" )
localify.Bind( "bg", prefix.."error_invalid_phys",       "Тази обектна единица няма валиден физически обект (неможе да се модифицитра теглото)" )
localify.Bind( "bg", prefix.."error_max_weight",         "Теглото неможе да надвишава максималното" )
-- Labels
localify.Bind( "bg", prefix.."label_colorscale",         "Цветна скала: " )
localify.Bind( "bg", prefix.."label_weight",             "Тегло: " )
localify.Bind( "bg", prefix.."label_decimals",           "Десетични знаци: " )
localify.Bind( "bg", prefix.."label_tooltip_scale",      "Размер на подсказката: " )
localify.Bind( "bg", prefix.."label_language",           "Език: " )
localify.Bind( "bg", prefix.."label_credits",            "Преведено на Български от [BA][Sk$Bh]Trick or treat KID!" )
-- Checkboxes
localify.Bind( "bg", prefix.."checkbox_round",           "Изобразявай закръглени тегла в подсказката" )
localify.Bind( "bg", prefix.."checkbox_tooltip_show",    "Винаги показвай подсказка" )
localify.Bind( "bg", prefix.."checkbox_tooltip_legacy",  "Използвай старинна подсказка" )
localify.Bind( "bg", prefix.."checkbox_notifs",          "Изобразявай уведомления" )
localify.Bind( "bg", prefix.."checkbox_notifs_sound",    "Свири уведомлителни звуци" )
-- Comboboxes
localify.Bind( "bg", prefix.."combobox_green_to_red",    "Зелено към Червено" )
localify.Bind( "bg", prefix.."combobox_green_to_yellow", "Зелено към Жълто" )
localify.Bind( "bg", prefix.."combobox_green_to_blue",   "Зелено към Синьо" )
localify.Bind( "bg", prefix.."combobox_blue_to_red",     "Синьо към Червено" )
localify.Bind( "bg", prefix.."combobox_none",            "Никаква" )
localify.Bind( "bg", prefix.."combobox_default",         "По подразбиране" )
-- Descriptions
localify.Bind( "bg", prefix.."help_colorscale",          "Добавя подсветка около обектната единица с цвят, представящ текущото тегло. Цветовете варират от минималния до максималния съответно." )
localify.Bind( "bg", prefix.."help_decimals",            "Определя до колко десетични знака, теглата ще бъдат закръглени когато се изобразяват върху HUD. Нула означава че се изобразяват само цели числа." )
localify.Bind( "bg", prefix.."help_tooltip_show",        "Показва подсказката дори когато инструмента не се използва." )
localify.Bind( "bg", prefix.."help_tooltip_scale",       "Определя размера на подсказката когато се чертае HUD." )
localify.Bind( "bg", prefix.."help_tooltip_legacy",      "Разрешава леко модифицирана подсказка използвана в по-стари версии на Garry's Mod." )
localify.Bind( "bg", prefix.."help_notifs",              "Разрешава помощни уведомления при прилагане, копиране, или възстановяване на теглото на обектната единца." )
localify.Bind( "bg", prefix.."help_notifs_sound",        "Разрешава уведомлителен звук, когато се прилага тегло на обектна единица." )
-- HUD Text
localify.Bind( "bg", prefix.."hud_original",             "Оригинален" )
localify.Bind( "bg", prefix.."hud_modified",             "Модифициран" )
-- Notifications
localify.Bind( "bg", prefix.."notif_applied",            "Приложено тегло" )
localify.Bind( "bg", prefix.."notif_copied",             "Копирано тегло" )
localify.Bind( "bg", prefix.."notif_restored",           "Възстановено тегло" )

--[[--------------------------------------------------------------------------
-- Russian Localization
-- Big thanks to Architector #4 (STEAM_0:1:38308154) and magic memes (STEAM_0:0:60429619) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "ru", prefix.."name",                     "Вес - Улучшенный" )
localify.Bind( "ru", prefix.."desc",                     "Изменяет вес объектов" )
localify.Bind( "ru", prefix.."left",                     "Применить вес" )
localify.Bind( "ru", prefix.."right",                    "Скопировать вес" )
localify.Bind( "ru", prefix.."reload",                   "Сбросить настройки вес" )
-- Errors
localify.Bind( "ru", prefix.."error_zero_weight",        "Вы должны применить вес больше чем 0" )
localify.Bind( "ru", prefix.."error_invalid_phys",       "Этот объект не имеет физических свойств (невозможно изменить вес)" )
localify.Bind( "ru", prefix.."error_max_weight",         "Вес не должен превышать максимум" )
-- Labels
localify.Bind( "ru", prefix.."label_colorscale",         "Градиент цвета: " )
localify.Bind( "ru", prefix.."label_weight",             "Вес: " )
localify.Bind( "ru", prefix.."label_decimals",           "Цифер после точки: " )
localify.Bind( "ru", prefix.."label_tooltip_scale",      "Размер подсказки: " )
localify.Bind( "ru", prefix.."label_language",           "Язык: " )
localify.Bind( "ru", prefix.."label_credits",            "Русский перевод от Architector #4 (STEAM_0:1:38308154) и magic memes (STEAM_0:0:60429619)" )
-- Checkboxes
localify.Bind( "ru", prefix.."checkbox_round",           "Отображать округлённые значения в подсказке" )
localify.Bind( "ru", prefix.."checkbox_tooltip_show",    "Всегда отображать подсказку" )
localify.Bind( "ru", prefix.."checkbox_tooltip_legacy",  "Использовать старую подсказку" )
localify.Bind( "ru", prefix.."checkbox_notifs",          "Отображать уведомления" )
localify.Bind( "ru", prefix.."checkbox_notifs_sound",    "Проигрывать звуки уведомления" )
-- Comboboxes
localify.Bind( "ru", prefix.."combobox_green_to_red",    "Из зелёного в красный" )
localify.Bind( "ru", prefix.."combobox_green_to_yellow", "Из зелёного в жёлтый" )
localify.Bind( "ru", prefix.."combobox_green_to_blue",   "Из зелёного в синий" )
localify.Bind( "ru", prefix.."combobox_blue_to_red",     "Из синего в красный" )
localify.Bind( "ru", prefix.."combobox_none",            "Без перехода" )
localify.Bind( "ru", prefix.."combobox_default",         "По умолчанию" )
-- Descriptions
localify.Bind( "ru", prefix.."help_colorscale",          "Добавляет сияние вокруг объекта со цветом, соответствующим его весу. Цвет меняется с минимума до максимума включительно." )
localify.Bind( "ru", prefix.."help_decimals",            "Устанавливает количество цифр после точки при показе веса в интерфейсе. Нуль приводит к отображению целых чисел." )
localify.Bind( "ru", prefix.."help_tooltip_show",        "Показывать подсказку даже если этот инструмент не используется." )
localify.Bind( "ru", prefix.."help_tooltip_scale",       "Устанавливает размер подсказки при отображении её в интерфейсе." )
localify.Bind( "ru", prefix.."help_tooltip_legacy",      "Сменяет стиль подсказки на чуть-чуть изменённый её вариант из старых версий Garry's Mod." )
localify.Bind( "ru", prefix.."help_notifs",              "Включает полезные сообщения при применении, копировании, или сбросе веса объекта." )
localify.Bind( "ru", prefix.."help_notifs_sound",        "Включает звуки уведомления при изменении веса объекта." )
-- HUD Text
localify.Bind( "ru", prefix.."hud_original",             "Оригинал" )
localify.Bind( "ru", prefix.."hud_modified",             "Изменённый" )
-- Notifications
localify.Bind( "ru", prefix.."notif_applied",            "Вес применён" )
localify.Bind( "ru", prefix.."notif_copied",             "Вес скопирован" )
localify.Bind( "ru", prefix.."notif_restored",           "Восстановлен начальный вес" )

--[[--------------------------------------------------------------------------
-- Korean Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "ko", prefix.."name",                     "향상된 - 무게" )
localify.Bind( "ko", prefix.."desc",                     "물체의 무게를 수정합니다" )
localify.Bind( "ko", prefix.."left",                     "무게 적용" )
localify.Bind( "ko", prefix.."right",                    "무게 복사" )
localify.Bind( "ko", prefix.."reload",                   "무게 재설정" )
-- Errors
localify.Bind( "ko", prefix.."error_zero_weight",        "무게는 0 이상이여야 합니다" )
localify.Bind( "ko", prefix.."error_invalid_phys",       "이 엔티티는 물리적인 물체가 아닙니다 (무게를 설정할 수 없음)" )
localify.Bind( "ko", prefix.."error_max_weight",         "무게는 최대값을 넘을 수 없습니다" )
-- Labels
localify.Bind( "ko", prefix.."label_colorscale",         "무게에 따른 색 변경: " )
localify.Bind( "ko", prefix.."label_weight",             "무게: " )
localify.Bind( "ko", prefix.."label_decimals",           "소수점 표시: " )
localify.Bind( "ko", prefix.."label_tooltip_scale",      "툴팁 크기: " )
localify.Bind( "ko", prefix.."label_language",           "언어: " )
localify.Bind( "ko", prefix.."label_credits",            "한국어 FCB 에 의해 번역됨 (STEAM_0:1:32029495)" )
-- Checkboxes
localify.Bind( "ko", prefix.."checkbox_round",           "툴팁에서 총 무게 표시하기" )
localify.Bind( "ko", prefix.."checkbox_tooltip_show",    "항상 툴팁 보이기" )
localify.Bind( "ko", prefix.."checkbox_tooltip_legacy",  "구버전 툴팁 사용하기" )
localify.Bind( "ko", prefix.."checkbox_notifs",          "알림 표시" )
localify.Bind( "ko", prefix.."checkbox_notifs_sound",    "알림 소리 재생하기" )
-- Comboboxes
localify.Bind( "ko", prefix.."combobox_green_to_red",    "녹색에서 빨간색으로" )
localify.Bind( "ko", prefix.."combobox_green_to_yellow", "녹색에서 노란색으로" )
localify.Bind( "ko", prefix.."combobox_green_to_blue",   "녹색에서 파란색으로" )
localify.Bind( "ko", prefix.."combobox_blue_to_red",     "파란색에서 빨간색으로" )
localify.Bind( "ko", prefix.."combobox_none",            "색 없음" )
localify.Bind( "ko", prefix.."combobox_default",         "디폴트" )
-- Descriptions
localify.Bind( "ko", prefix.."help_colorscale",          "현재 무게를 색을 입혀 표시합니다. 낮은 무게에서 높은 무게로 갈수록 점점 그 색으로 변합니다." )
localify.Bind( "ko", prefix.."help_decimals",            "반올림을 하지 않은 소수점을 몇째 자리까지 표시할지 결정합니다. 0은 소수점을 표시하지 않습니다." )
localify.Bind( "ko", prefix.."help_tooltip_show",        "무게 툴이 사용되지 않을때에도 툴팁이 계속 뜨게합니다." )
localify.Bind( "ko", prefix.."help_tooltip_scale",       "화면에 표시될 툴팁의 크기를 설정합니다." )
localify.Bind( "ko", prefix.."help_tooltip_legacy",      "이전 게리모드에서 사용된 툴팁을 사용할 수 있습니다." )
localify.Bind( "ko", prefix.."help_notifs",              "당신이 설정하거나, 복사하거나 혹은 물체의 무게를 재설정할때 나타나는 도움말을 표시합니다." )
localify.Bind( "ko", prefix.."help_notifs_sound",        "물체의 무게를 설정할 때 알림음이 재생되게 합니다." )
-- HUD Text
localify.Bind( "ko", prefix.."hud_original",             "기존 무게" )
localify.Bind( "ko", prefix.."hud_modified",             "수정된 무게" )
-- Notifications
localify.Bind( "ko", prefix.."notif_applied",            "무게 설정됨" )
localify.Bind( "ko", prefix.."notif_copied",             "무게 복사됨" )
localify.Bind( "ko", prefix.."notif_restored",           "기존 무게로 재설정됨" )

--[[--------------------------------------------------------------------------
-- French Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "fr", prefix.."name",                     "Poids - Amelioré" )
localify.Bind( "fr", prefix.."desc",                     "Modifie le poids d'une entité" )
localify.Bind( "fr", prefix.."left",                     "Appliquer le poids à l'entité" )
localify.Bind( "fr", prefix.."right",                    "Copier le poids de l'entité" )
localify.Bind( "fr", prefix.."reload",                   "Réinitialiser le poids de l'entité" )
-- Errors
localify.Bind( "fr", prefix.."error_zero_weight",        "Vous devez sélectionner un poids supérieur à 0" )
localify.Bind( "fr", prefix.."error_invalid_phys",       "Cette entitée n'a pas d'objet de physiques valide (vous ne pouvez pas en modifier le poids)" )
localify.Bind( "fr", prefix.."error_max_weight",         "Le poids ne peut pas excéder le maximum autorisé" )
-- Labels
localify.Bind( "fr", prefix.."label_colorscale",         "Échelle de Couleurs: " )
localify.Bind( "fr", prefix.."label_weight",             "Poids: " )
localify.Bind( "fr", prefix.."label_decimals",           "Décimales: " )
localify.Bind( "fr", prefix.."label_tooltip_scale",      "Taille de l'Info-Bulle: " )
localify.Bind( "fr", prefix.."label_language",           "Langue: " )
localify.Bind( "fr", prefix.."label_credits",            "Traduit en français par Vulpelix (STEAM_0:0:188400109)" )
-- Checkboxes
localify.Bind( "fr", prefix.."checkbox_round",           "Bords arrondis sur l'info-bulle" )
localify.Bind( "fr", prefix.."checkbox_tooltip_show",    "Toujours montrer l'info-bulle" )
localify.Bind( "fr", prefix.."checkbox_tooltip_legacy",  "Utiliser l'ancienne info-bulle" )
localify.Bind( "fr", prefix.."checkbox_notifs",          "Afficher les notifications" )
localify.Bind( "fr", prefix.."checkbox_notifs_sound",    "Activer le son des notifications" )
-- Comboboxes
localify.Bind( "fr", prefix.."combobox_green_to_red",    "Vert à Rouge" )
localify.Bind( "fr", prefix.."combobox_green_to_yellow", "Vert à Jaune" )
localify.Bind( "fr", prefix.."combobox_green_to_blue",   "Vert à Bleu" )
localify.Bind( "fr", prefix.."combobox_blue_to_red",     "Bleu à Rouge" )
localify.Bind( "fr", prefix.."combobox_none",            "Aucune" )
localify.Bind( "fr", prefix.."combobox_default",         "Défaut" )
-- Descriptions
localify.Bind( "fr", prefix.."help_colorscale",          "Ajoute un halo autour de l'entité ciblée avec une couleur pour représenter son poids actuel. Les couleurs vont respectivement du minimum au maxium." )
localify.Bind( "fr", prefix.."help_decimals",            "Détermine à combien de nombres après la virgule le poids devrait être arrondi quand affiché dans le HUD. Zéro n'affichera que des nombres entiers." )
localify.Bind( "fr", prefix.."help_tooltip_show",        "Affiche l'info-bulle même lorsque l'outil n'est pas utilisé." )
localify.Bind( "fr", prefix.."help_tooltip_scale",       "Modifie la taille de l'info-bulle." )
localify.Bind( "fr", prefix.."help_tooltip_legacy",      "Affiche une info-bulle légèrement modifiée utilisée dans les anciennes verions de Garry's Mod." )
localify.Bind( "fr", prefix.."help_notifs",              "Activer les notifications lorsque vous appliquez, copiez ou réintialisez le poids d'une entité." )
localify.Bind( "fr", prefix.."help_notifs_sound",        "Activer le son des notifications lorsque vous appliquez le poids à une entité." )
-- HUD Text
localify.Bind( "fr", prefix.."hud_original",             "Original" )
localify.Bind( "fr", prefix.."hud_modified",             "Modifié" )
-- Notifications
localify.Bind( "fr", prefix.."notif_applied",            "Poids appliqué à l'entité" )
localify.Bind( "fr", prefix.."notif_copied",             "Poids de l'entité copié" )
localify.Bind( "fr", prefix.."notif_restored",           "Poids original restauré" )

--[[--------------------------------------------------------------------------
-- Estonian Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "et", prefix.."name",                     "Kaal - täiustatud" )
localify.Bind( "et", prefix.."desc",                     "Muudab üksuse kaalu" )
localify.Bind( "et", prefix.."left",                     "Rakenda kaal" )
localify.Bind( "et", prefix.."right",                    "Kopeerimise kaal" )
localify.Bind( "et", prefix.."reload",                   "Lähtesta kaal" )
-- Errors
localify.Bind( "et", prefix.."error_zero_weight",        "Peate rakendama kaalu, mis on suurem kui 0" )
localify.Bind( "et", prefix.."error_invalid_phys",       "See üksus ei oma kehtivat füüsikaobjekti (ei saa muuta kaalu)" )
localify.Bind( "et", prefix.."error_max_weight",         "Kaal ei tohi ületada max" )
-- Labels
localify.Bind( "et", prefix.."label_colorscale",         "Värviklass: " )
localify.Bind( "et", prefix.."label_weight",             "Kaal: " )
localify.Bind( "et", prefix.."label_decimals",           "Kümnendkohad: " )
localify.Bind( "et", prefix.."label_tooltip_scale",      "Tooltipi skaala: " )
localify.Bind( "et", prefix.."label_language",           "Keel: " )
localify.Bind( "et", prefix.."label_credits",            "Eesti tõlge - [EE] Jamairis McWay (STEAM_0:1:168225547)" )
-- Checkboxes
localify.Bind( "et", prefix.."checkbox_round",           "Näita ümardatud kaalusid tööriista näites" )
localify.Bind( "et", prefix.."checkbox_tooltip_show",    "Näita alati tööriista" )
localify.Bind( "et", prefix.."checkbox_tooltip_legacy",  "Kasutage pärandit" )
localify.Bind( "et", prefix.."checkbox_notifs",          "Kuva teateid" )
localify.Bind( "et", prefix.."checkbox_notifs_sound",    "Esitatakse teate heli" )
-- Comboboxes
localify.Bind( "et", prefix.."combobox_green_to_red",    "Roheline kuni punane" )
localify.Bind( "et", prefix.."combobox_green_to_yellow", "Roheline kuni kollane" )
localify.Bind( "et", prefix.."combobox_green_to_blue",   "Roheline kuni sinine" )
localify.Bind( "et", prefix.."combobox_blue_to_red",     "Sinine kuni punane" )
localify.Bind( "et", prefix.."combobox_none",            "Puudub" )
localify.Bind( "et", prefix.."combobox_default",         "Vaikimisi" )
-- Descriptions
localify.Bind( "et", prefix.."help_colorscale",          "Lisab sihtühiku ümber halo, mille värv esindab selle praegust kaalu. Värvid lähevad vastavalt miinimumist maksimumini." )
localify.Bind( "et", prefix.."help_decimals",            "Määrab, kui palju kümnendkohad kaalud ümardatakse, kui neid HUD-s kuvatakse. Null tähendab täisarvude kuvamist." )
localify.Bind( "et", prefix.."help_tooltip_show",        "Näitab tööriista ka siis, kui kaalutööriista ei kasutata." )
localify.Bind( "et", prefix.."help_tooltip_scale",       "Seadistab tööriista suuruse HUD-i joonistamisel." )
localify.Bind( "et", prefix.."help_tooltip_legacy",      "Võimaldab veidi modifitseeritud tööriista kasutada Garry Modi vanemates versioonides." )
localify.Bind( "et", prefix.."help_notifs",              "Võimaldab kasutada kasulikke teatisi, kui rakendatakse, kopeeritakse või lähtestate ettevõtte kehakaalu." )
localify.Bind( "et", prefix.."help_notifs_sound",        "Võimaldab teavitamise heli, kui rakendate kehale kaalu." )
-- HUD Text
localify.Bind( "et", prefix.."hud_original",             "Originaal" )
localify.Bind( "et", prefix.."hud_modified",             "Muudetud" )
-- Notifications
localify.Bind( "et", prefix.."notif_applied",            "Rakendatud kaal" )
localify.Bind( "et", prefix.."notif_copied",             "Kopeeritud kaal" )
localify.Bind( "et", prefix.."notif_restored",           "Taastatud esialgne kaal" )

--[[--------------------------------------------------------------------------
-- Thai Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "th", prefix.."name",                     "น้ำหนัก - ปรับปรุง" )
localify.Bind( "th", prefix.."desc",                     "แก้ไขน้ำหนักของเอนทิตี" )
localify.Bind( "th", prefix.."left",                     "ใช้น้ำหนัก" )
localify.Bind( "th", prefix.."right",                    "คัดลอกน้ำหนัก" )
localify.Bind( "th", prefix.."reload",                   "รีเซ็ตน้ำหนัก" )
-- Errors
localify.Bind( "th", prefix.."error_zero_weight",        "คุณต้องใช้น้ำหนักที่มากกว่า 0" )
localify.Bind( "th", prefix.."error_invalid_phys",       "เอนทิตีนี้ไม่มีวัตถุฟิสิกส์ที่ถูกต้อง (ไม่สามารถแก้ไขน้ำหนักได้)" )
localify.Bind( "th", prefix.."error_max_weight",         "น้ำหนักต้องไม่เกินกว่าค่าสูงสุด" )
-- Labels
localify.Bind( "th", prefix.."label_colorscale",         "สเกลสี: " )
localify.Bind( "th", prefix.."label_weight",             "น้ำหนัก: " )
localify.Bind( "th", prefix.."label_decimals",           "ตำแหน่งทศนิยม: " )
localify.Bind( "th", prefix.."label_tooltip_scale",      "คู่มืออุปกรณ์มาตราส่วน: " )
localify.Bind( "th", prefix.."label_language",           "ภาษา: " )
localify.Bind( "th", prefix.."label_credits",            "ไทย การแปลโดย [ATA] Combine Empire Reich (STEAM_0:1:77082118)" )
-- Checkboxes
localify.Bind( "th", prefix.."checkbox_round",           "แสดงตุ้มน้ำหนักแบบกลมในคำแนะนำเครื่องมือ" )
localify.Bind( "th", prefix.."checkbox_tooltip_show",    "แสดงคำแนะนำเครื่องมือเสมอ" )
localify.Bind( "th", prefix.."checkbox_tooltip_legacy",  "ใช้คำแนะนำเครื่องมือแบบเดิม" )
localify.Bind( "th", prefix.."checkbox_notifs",          "แสดงการแจ้งเตือน" )
localify.Bind( "th", prefix.."checkbox_notifs_sound",    "เล่นเสียงแจ้งเตือน" )
-- Comboboxes
localify.Bind( "th", prefix.."combobox_green_to_red",    "เขียวถึงแดง" )
localify.Bind( "th", prefix.."combobox_green_to_yellow", "เขียวถึงเหลือง" )
localify.Bind( "th", prefix.."combobox_green_to_blue",   "เขียวถึงน้ำเงิน" )
localify.Bind( "th", prefix.."combobox_blue_to_red",     "น้ำเงินถึงแดง" )
localify.Bind( "th", prefix.."combobox_none",            "ไม่มี" )
localify.Bind( "th", prefix.."combobox_default",         "ค่าเริ่มต้น" )
-- Descriptions
localify.Bind( "th", prefix.."help_colorscale",          "เพิ่มรัศมีรอบเอนทิตีเป้าหมายด้วยสีที่แสดงถึงน้ำหนักปัจจุบัน สีเริ่มจากต่ำสุดไปสูงสุดตามลำดับ" )
localify.Bind( "th", prefix.."help_decimals",            "กำหนดว่าจะปัดเศษทศนิยมกี่ตำแหน่งเมื่อแสดงใน HUD ศูนย์หมายถึงแสดงตัวเลขทั้งหมด" )
localify.Bind( "th", prefix.."help_tooltip_show",        "แสดงคำแนะนำเครื่องมือแม้ว่าจะไม่ได้ใช้เครื่องมือน้ำหนัก" )
localify.Bind( "th", prefix.."help_tooltip_scale",       "กำหนดขนาดของคำแนะนำเครื่องมือเมื่อวาด HUD" )
localify.Bind( "th", prefix.."help_tooltip_legacy",      "เปิดใช้งานคำแนะนำเครื่องมือที่ปรับเปลี่ยนเล็กน้อยที่ใช้ในรุ่นเก่าของ Garry's Mod" )
localify.Bind( "th", prefix.."help_notifs",              "เปิดใช้งานการแจ้งเตือนที่เป็นประโยชน์เมื่อนำไปใช้คัดลอกหรือรีเซ็ตน้ำหนักของเอนทิตี" )
localify.Bind( "th", prefix.."help_notifs_sound",        "เปิดใช้งานเสียงแจ้งเตือนเมื่อใช้น้ำหนักกับเอนทิตี" )
-- HUD Text
localify.Bind( "th", prefix.."hud_original",             "ต้นฉบับ" )
localify.Bind( "th", prefix.."hud_modified",             "ดัดแปลง" )
-- Notifications
localify.Bind( "th", prefix.."notif_applied",            "น้ำหนักประยุกต์" )
localify.Bind( "th", prefix.."notif_copied",             "คัดลอกน้ำหนักแล้ว" )
localify.Bind( "th", prefix.."notif_restored",           "เรียกคืนน้ำหนักดั้งเดิม" )

-- Tool Settings
localify.Bind( "zh-cn", prefix.."name",                     "重量工具 - 升级版" )
localify.Bind( "zh-cn", prefix.."desc",                     "此工具可以修改实体的重量" )
localify.Bind( "zh-cn", prefix.."left",                     "应用重量" )
localify.Bind( "zh-cn", prefix.."right",                    "复制重量" )
localify.Bind( "zh-cn", prefix.."reload",                   "重置重量" )
-- Errors
localify.Bind( "zh-cn", prefix.."error_zero_weight",        "你必须输入比 0 大的数值" )
localify.Bind( "zh-cn", prefix.."error_invalid_phys",       "此实体无有效的碰撞实体（无法修改重量）" )
localify.Bind( "zh-cn", prefix.."error_max_weight",         "重量不可超出上限" )
-- Labels
localify.Bind( "zh-cn", prefix.."label_colorscale",         "颜色变化：" )
localify.Bind( "zh-cn", prefix.."label_weight",             "重量：" )
localify.Bind( "zh-cn", prefix.."label_decimals",           "小数点：" )
localify.Bind( "zh-cn", prefix.."label_tooltip_scale",      "提示条大小：" )
localify.Bind( "zh-cn", prefix.."label_language",           "语言：" )
localify.Bind( "zh-cn", prefix.."label_credits",            "简体中文翻译 - Insane Black Rock Shooter（STEAM_0:1:176977754）" )
-- Checkboxes
localify.Bind( "zh-cn", prefix.."checkbox_round",           "提示条上显示四舍五入后的重量" )
localify.Bind( "zh-cn", prefix.."checkbox_tooltip_show",    "总是显示提示条" )
localify.Bind( "zh-cn", prefix.."checkbox_tooltip_legacy",  "使用原版提示条" )
localify.Bind( "zh-cn", prefix.."checkbox_notifs",          "显示提示信息" )
localify.Bind( "zh-cn", prefix.."checkbox_notifs_sound",    "播放提示音效" )
-- Comboboxes
localify.Bind( "zh-cn", prefix.."combobox_green_to_red",    "绿色到红色" )
localify.Bind( "zh-cn", prefix.."combobox_green_to_yellow", "绿色到黄色" )
localify.Bind( "zh-cn", prefix.."combobox_green_to_blue",   "绿色到蓝色" )
localify.Bind( "zh-cn", prefix.."combobox_blue_to_red",     "蓝色到红色" )
localify.Bind( "zh-cn", prefix.."combobox_none",            "无" )
localify.Bind( "zh-cn", prefix.."combobox_default",         "默认" )
-- Descriptions
localify.Bind( "zh-cn", prefix.."help_colorscale",          "在目标实体周围添加一个光圈，其颜色代表其当前重量。颜色分别从最小值到最大值渐变。" )
localify.Bind( "zh-cn", prefix.."help_decimals",            "指定在 HUD 上显示重量时，重量应保留的小数位数。零表示保留到整数。" )
localify.Bind( "zh-cn", prefix.."help_tooltip_show",        "即使玩家未在使用重量工具，也会显示提示条。" )
localify.Bind( "zh-cn", prefix.."help_tooltip_scale",       "设置 HUD 上显示的提示条大小。" )
localify.Bind( "zh-cn", prefix.."help_tooltip_legacy",      "启用旧版 Garry's Mod 中略微改进过的提示条。" )
localify.Bind( "zh-cn", prefix.."help_notifs",              "启用对实体应用重量，复制重量或者重置重量时的提示信息。" )
localify.Bind( "zh-cn", prefix.."help_notifs_sound",        "启用对实体应用重量时提示信息的音效。" )
-- HUD Text
localify.Bind( "zh-cn", prefix.."hud_original",             "原重量" )
localify.Bind( "zh-cn", prefix.."hud_modified",             "修改重量" )
-- Notifications
localify.Bind( "zh-cn", prefix.."notif_applied",            "已应用重量" )
localify.Bind( "zh-cn", prefix.."notif_copied",             "已复制重量" )
localify.Bind( "zh-cn", prefix.."notif_restored",           "已恢复原重量" )

--[[--------------------------------------------------------------------------
-- <Other> Localization
--------------------------------------------------------------------------]]--
--[[
-- Tool Settings
localify.Bind( "", prefix.."name",                     "" )
localify.Bind( "", prefix.."desc",                     "" )
localify.Bind( "", prefix.."left",                     "" )
localify.Bind( "", prefix.."right",                    "" )
localify.Bind( "", prefix.."reload",                   "" )
-- Errors
localify.Bind( "", prefix.."error_zero_weight",        "" )
localify.Bind( "", prefix.."error_invalid_phys",       "" )
localify.Bind( "", prefix.."error_max_weight",         "" )
-- Labels
localify.Bind( "", prefix.."label_colorscale",         "" )
localify.Bind( "", prefix.."label_weight",             "" )
localify.Bind( "", prefix.."label_decimals",           "" )
localify.Bind( "", prefix.."label_tooltip_scale",      "" )
localify.Bind( "", prefix.."label_language",           "" )
localify.Bind( "", prefix.."label_credits",            "" )
-- Checkboxes
localify.Bind( "", prefix.."checkbox_round",           "" )
localify.Bind( "", prefix.."checkbox_tooltip_show",    "" )
localify.Bind( "", prefix.."checkbox_tooltip_legacy",  "" )
localify.Bind( "", prefix.."checkbox_notifs",          "" )
localify.Bind( "", prefix.."checkbox_notifs_sound",    "" )
-- Comboboxes
localify.Bind( "", prefix.."combobox_green_to_red",    "" )
localify.Bind( "", prefix.."combobox_green_to_yellow", "" )
localify.Bind( "", prefix.."combobox_green_to_blue",   "" )
localify.Bind( "", prefix.."combobox_blue_to_red",     "" )
localify.Bind( "", prefix.."combobox_none",            "" )
localify.Bind( "", prefix.."combobox_default",         "" )
-- Descriptions
localify.Bind( "", prefix.."help_colorscale",          "" )
localify.Bind( "", prefix.."help_decimals",            "" )
localify.Bind( "", prefix.."help_tooltip_show",        "" )
localify.Bind( "", prefix.."help_tooltip_scale",       "" )
localify.Bind( "", prefix.."help_tooltip_legacy",      "" )
localify.Bind( "", prefix.."help_notifs",              "" )
localify.Bind( "", prefix.."help_notifs_sound",        "" )
-- HUD Text
localify.Bind( "", prefix.."hud_original",             "" )
localify.Bind( "", prefix.."hud_modified",             "" )
-- Notifications
localify.Bind( "", prefix.."notif_applied",            "" )
localify.Bind( "", prefix.."notif_copied",             "" )
localify.Bind( "", prefix.."notif_restored",           "" )
]]

-- Hopefully will add more with community/crowdsource support.

-- If you are multi/bilingual, please consider helping me translate the phrases above into other languages.
-- Create an issue on the Github page ( https://github.com/Mista-Tea/improved-weight ) or
-- add me on Steam ( http://steamcommunity.com/profiles/76561198015280374 ). Thanks!
