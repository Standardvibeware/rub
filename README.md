# Rub-A-Monster Maker 🖍️

A browser game that recreates the classic kids' rubbing-plate toys (TOMY's *Mighty Men & Monster Maker* / *Fashion Plates*): plastic plates with raised outlines that you mix and match, lay paper over, and rub with a crayon to transfer the design.

**Play it:** https://standardvibeware.github.io/rub/

## How to play

1. **Pick your plates** — a head, a torso, and legs from the tray (or hit SHUFFLE). Switch between the **MONSTERS** and **FASHION** packs.
2. **RUB / TRACE** — scribble back and forth on the paper with your finger or mouse. The hidden design transfers through, just like the real toy: the more you rub, the darker the line.
3. **COLOR IN** — switch modes, pick a crayon, and color your creation.
4. **SAVE PNG** — keep your artwork.

125 combinations per pack. Works on desktop and phones.

## Running locally

Everything lives in a single `index.html` — open it in any browser, or:

```sh
git clone https://github.com/Standardvibeware/rub.git && cd rub
python3 -m http.server 8000   # then visit http://localhost:8000
```

## How it works

The figure is hidden line art on an offscreen canvas. Pointer strokes deposit a noisy "wax" mask; the art shows through only where wax has accumulated, with a faint smear everywhere else — the same selective-transfer feel as rubbing paper over raised plastic ridges.

`assets/reference_toy.jpg` is a photo of the original toy this is based on.
