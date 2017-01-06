$('select#state-select').change(
	function() {
		$('select#region-select').removeAttr('disabled')
		$('select#region-select').val('Any')
		this.form.submit() 
	}
)