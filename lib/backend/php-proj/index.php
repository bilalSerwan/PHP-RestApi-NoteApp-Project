<?php

class Rahand{

    function print(): void
    {
        echo "hi my name's Rahand \n";
    }
}
class Bilal extends Rahand{

     function print(): void
    {
        echo "hi my name's Bilal \n";
    }

}

$bilal = New Bilal();
$bilal->print();
$rahand = new Rahand();
$rahand->print();

