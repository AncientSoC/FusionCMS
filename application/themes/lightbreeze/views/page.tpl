<div class="page_content page">
	<div class="page_title">
		<h3><span>{$headline}</span></h3>
	</div>
	<div class="page_body">
		{$content}
	</div>
</div>

<script type="text/javascript">
	var title_element = $('.page .page_title span'), 
		data          = title_element.text(), 
		data_arr      = data.split(' ');
	
	if(data_arr.length && !$(title_element).find('span').length)
	{
		title_element.empty();
		
		for(word in this.data_arr)
		{
			if(word == 0)
				title_element.append('<i>' + this.data_arr[word] + '</i>&nbsp;');
			else
				title_element.append(this.data_arr[word] + '&nbsp;');
		}
	}
	
	if(typeof CustomJS !== 'undefined')
		CustomJS.initialize();
</script>