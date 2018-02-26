%include("./v6/header",stada="Heim")
<div class="boxContainer">
	%for x in fyrirtaeki:
	<a href="fyrirtaeki/{{x}}">
		<div class="box">
			<div class="mynd">
				<img src="/myndir/{{x}}.png">
			</div>
			<h3>{{x}}</h3>
		</div>
	</a>
	%end
%include("./v6/footer")
</div>