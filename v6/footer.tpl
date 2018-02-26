	<div class="odyrast">
		<div class="odyrastBox">
			<h3>Ódýrasta bensín</h3>
			%for x in odyrastaB:
				<h4>{{x["bensin95"]}} kr. <a href="/stod/{{x['key']}}">{{x["company"]}} {{x["name"]}}</a></h4>
			%end
		</div>
		<div class="odyrastBox">
			<h3>Ódýrasta díesel</h3>
			%for x in odyrastaD:
				<h4>{{x["diesel"]}} kr. <a href="/stod/{{x['key']}}">{{x["company"]}} {{x["name"]}}</a></h4>
			%end
		</div>
	</div>
	<h3 class="timi">Seinast uppfært: <span>{{date}}</span></h3>
</div>
</body>
</html>