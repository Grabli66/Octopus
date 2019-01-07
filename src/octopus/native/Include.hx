package octopus.native;

@:buildXml("
<files id='haxe'>
  <compilerflag value='-I${haxelib:octopus}/libs/Modest/source'/>
</files>
<files id='__lib__'>
  <compilerflag value='-I${haxelib:octopus}/libs/Modest/source'/>
</files>
<target id='haxe'>
    <lib name='-L${haxelib:octopus}/libs/Modest/lib'/>
    <lib name='-lmodest_static'/>
</target>
")
@:keep class Include{

}