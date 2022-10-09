#!/bin/bash
echo "Installing Swerty..."

# Add custom key map to system file with swedish layouts.
if [ -z "$(grep "swerty" /usr/share/X11/xkb/symbols/se)" ]; then
    sudo bash -c 'cat key_map.txt >> /usr/share/X11/xkb/symbols/se'
fi

# Add variant infomation to evdev.xml
if [ -z "$(grep "swerty" /usr/share/X11/xkb/rules/evdev.xml)" ]; then
    sudo sed -i '/>swe</{
    :a                          
    N                                                  
    /<variantList>/!ba                                                                  
    revdev_variant.lst
    }
    ' /usr/share/X11/xkb/rules/evdev.xml
fi

# Add variant infomation to evdev.lst
if [ -z "$(grep "swerty" /usr/share/X11/xkb/rules/evdev.lst)" ]; then
    sudo sed -i '/\! variant/a swerty		se: Swerty (Swedish) ' /usr/share/X11/xkb/rules/evdev.lst
fi

echo ""
echo "Installation done!"