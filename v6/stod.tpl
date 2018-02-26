%include("./v6/header",stada="Stöð")
<div class="kort">
	<iframe 
		width="100%"
		height="350"
		frameborder="0" style="border:0"
		src="https://www.google.com/maps/embed/v1/view
		?key=AIzaSyAUeHLZ9nRI8nWvrCH5TZUbBWdFw5aNee4
		&center={{stod['geo']['lat']}},{{stod['geo']['lon']}}
		&zoom=18
		&maptype=satellite"
	></iframe>
</div>
<table>
  <tr>
    <th>Fyrirtæki</th>
    <th>Staðsetning</th>
    <th>Bensín95</th>
    %if stod["bensin95_discount"] is not None:
	<th>Með Afslætti</th>
   	%end
    <th>Díesel</th>
    %if stod["diesel_discount"] is not None:
	<th>Með Afslætti</th>
   	%end
  </tr>
	  <tr>
	    <td>{{stod["company"]}}</td>
	    <td>{{stod["name"]}}</td>
	    <td>{{stod["bensin95"]}} kr.</td>
    	%if stod["bensin95_discount"] is not None:
	    <td>{{stod["bensin95_discount"]}} kr.</td>
   		%end
	    <td>{{stod["diesel"]}} kr.</td>
    	%if stod["diesel_discount"] is not None:
	    <td>{{stod["diesel_discount"]}} kr.</td>
   		%end
	  </tr>
</table>
<div class="tilbaka">
	<a href="/">Heim</a>
	<a href="/fyrirtaeki/{{stod['company']}}">Til baka</a>
</div>
%include("./v6/footer")
