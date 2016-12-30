<div id="conteiner">
    <div class="row">
        <div id="myCarousel">
            <#if entries?has_content>
                <#list entries as curEntry>
                    //Variable assignment
                    <#assign assetRenderer=curEntry.getAssetRenderer() />
                    <#assign title= curEntry.getTitle(locale) />
                    <#assign summary = assetRenderer.getSummary(locale) />
                    <#assign link = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />
                    <#assign url = link?substring(link?last_index_of("/")) />
                    
                    <#assign base = themeDisplay.getURLHome() />
                    <#assign pre = '/-/asset_publisher/' />
                    //Next you must to add the ID instance where do you want to display the content. 
                    <#assign instance = '' />
                    <#assign content = '/content' />
                    <#assign url2 = base + pre + instance + content + url/>
                    
                    <div class="carousel-item" style="background: url(${assetRenderer.getThumbnailPath(renderRequest)});">
                        <div class="info png">
                            <h1>${title}</h1>
                            <p>${summary}</p>
                            <a href="${url2}" alt="${title}">See More</a>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
    </div>
</div>
<script type="text/javascript">
YUI().use(
    'aui-carousel',
    function(Y) {
        new Y.Carousel({
            contentBox: '#myCarousel',
            intervalTime: 4,
            height: 254
        }).render();
    }
);
</script>
