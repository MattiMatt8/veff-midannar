%include("./v6/header",stada="Stöðvar")
<div class="tilbaka">
	<a href="/">Til baka</a>
</div>
<table>
	<tr>
		<th>Fyrirtæki</th>
		<th>Staðsetning</th>
		<th></th>
	</tr>
	%margar = 0
	%for stod in stodvar:
	%margar += 1
	<tr>
		<td>{{stod["company"]}}</td>
		<td>{{stod["name"]}}</td>
		<td><a href="/stod/{{stod["key"]}}">Nánar</a></td>
	</tr>
	%end
	<tr>
		<td class="fjoldi" colspan="2">Fjöldi stöðva</td>	
		<td>{{margar}}</td>	
	</tr>
</table>
%include("./v6/footer")