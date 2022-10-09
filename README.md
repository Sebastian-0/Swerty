# Swerty
US qwerty layout but with access to åäö by using 'ALT + ;', 'ALT + "' and 'ALT + ['.

Based on [this repository](https://github.com/eliasaronson/US-keyboard-with-Swedish-letters) combined with [Swerty](https://johanegustafsson.net/projects/swerty/).

## Installation
There are two installation methods, a manual and an automatic one which performs the same
tasks as the manual steps. The install-script has been tested on Arch and Ubuntu, but I give no guaranties and take no responsibility if something breaks.

### Automatic
0. Clone this repo.

```
git clone https://github.com/Sebastian-0/Swerty && cd Swerty
```

1. Run the install-script. This changes keyboard system files and requires superuser privileges.
```
./install.sh
```

2. To activate the new layout run:
```
setxkbmap -layout se -variant swerty
```

You can run the install script multiple times, it only installs the changes if they are not present already. This can be useful if the layout is uninstalled by the OS.

## Manual
0. Clone this repo.
```
git clone https://github.com/Sebastian-0/Swerty.git && cd Swerty
```

1. Add the contents of key_map.txt to the end of `/usr/share/X11/xkb/symbols/se`.

2. Look up the following section in the file `/usr/share/X11/xkb/rules/evdev.xml`:

```
<layout>
 <configItem>
   <name>se</name>
     <shortDescription>Swe</shortDescription>
     <description>Sweden</description>
     <languageList><iso639Id>swe</iso639Id></languageList>
  </configItem>
  <variantList>
```

3. Add the following variant below <variantList>.

```
<variant>
  <configItem>
    <name>swerty</name>
    <description>Swerty (Swedish)</description>
  </configItem>
</variant>
```

4. After the line "! variant" in the file /usr/share/X11/xkb/rules/evdev.lst *  add the following:

```
 swerty		se: Swerty (Swedish)
```

5. To activate the new layout run:

```
setxkbmap -layout se -variant swerty
```

## Notes
* On some older systems the path to `evdev.lst` is `/usr/share/X11/skb/rules/evdev.lst` instead.
* If you want to customise the keys all mappings are set in `key_map.txt`.
