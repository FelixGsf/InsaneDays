package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
import StoryMenuState;
import openfl.Assets;

class LoreModSubState extends MusicBeatSubstate {
    var bgAlpha:FlxSprite;
    var textVar:FlxText;
    override function create() {
        super.create();
        bgAlpha = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        bgAlpha.alpha = 0.6;
        bgAlpha.screenCenter(XY);
        add(bgAlpha);
        if (StoryMenuState.curWeek == 0) {
            textVar = new FlxText(0, 0, 700, "Despues de su encuentro, mari y felix salen por un largo tiempo.
            en este lapso ellos 2 se hacen pareja. en una de sus salidas ellos llegan al lugar donde se conocieron por primera vez, estaba
            demasiado solo pero en muy buen estado, ella le dice a felix
            ¿que te parece calentar tu garganta? desde que llegaste no te eh escuchado cantar.
            felix acepta, ya teniendo pensado lo que iba a cantar. unas palabras las cuales 
            su abuelo le ayudo a elegir, una cancion la cual su abuelo le dijo que le dedicara a la mujer que el amara.", 22);
            textVar.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, CENTER);
            textVar.screenCenter(XY);
            add(textVar);
        }
        else if (StoryMenuState.curWeek == 1){
            textVar = new FlxText(0, 0, 700, "Mientras nuestros protas volvían a casa
Son interceptados por un viejo conocido: 'Rayo', es el ex mejor amigo de Félix y esté no estaba
Solo, venía acompañado de su hermana con una sola misión... matar a Félix.
Pero Rayo le da la oportunidad de que le gane rapeado, pero no será fácil, esté tambien.
Intentará completar su misión mientras transcurren las canciones. ¿podria ser el fin?", 22);
            textVar.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, CENTER);
            textVar.screenCenter(XY);
            add(textVar);
        }
        else if (StoryMenuState.curWeek == 2){
            textVar = new FlxText(0, 0, 700, "Despues de salir victoriosos contra rayo, estos 2 se reconcilian 
            y se despiden. Mari le pregunta a felix: ¿Has vuelto a hablar con exmix? este le responde que no,
            que hace mucho no sabe de el. despues de una larga caminata ha altas hora de la noche, escuchan un voz de conocida.
           felix emocionado de volver a encontrase con su amigo. aprovechando el silencion que habia en la cancha, da la idea de
           cantar. ¿cantar? ¿a esas horas? dice felix.
        si, no se preocupen, si quieren pueden quedarse a dormir en mi casa, dice exmix.
        entonces es hora de Rapear!", 22);
            textVar.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, CENTER);
            textVar.screenCenter(XY);
            add(textVar);
        }
         else {
            textVar = new FlxText(0, 0, 700, "Proximamente...", 22);
            textVar.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, CENTER);
            textVar.screenCenter(XY);
            add(textVar);
        }
    }

    override function update(elapsed:Float) {
        if (FlxG.keys.justPressed.ESCAPE){
            close();
        }
        super.update(elapsed);
    }
}