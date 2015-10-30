{strip}
    <div class="bodyHeader">
		<div class="leftSide col-md-3">
			<div class="pull-left selectSearch">
				<div class="input-group globalSearchInput">
					<span class="input-group-btn">
						<select class="chzn-select form-control col-md-5" title="{*vtranslate('LBL_SEARCH_MODULE', $MODULE_NAME)*}" id="basicSearchModulesList" >
							<option value="" class="globalSearch_module_All">{*vtranslate('LBL_ALL_RECORDS', $MODULE_NAME)*}</option>
							{*foreach key=MODULE_NAME item=fieldObject from=$SEARCHABLE_MODULES}
							{if isset($SEARCHED_MODULE) && $SEARCHED_MODULE eq $MODULE_NAME && $SEARCHED_MODULE !== 'All'}
							<option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}" selected>{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
							{else}
							<option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}">{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
							{/if}
							{/foreach*}
						</select>
					</span>
					<input type="text" class="form-control" title="{*vtranslate('LBL_GLOBAL_SEARCH')*}" id="globalSearchValue" placeholder="{*vtranslate('LBL_GLOBAL_SEARCH')*}" results="10" />
					<span class="input-group-btn">
						<button class="btn btn-default" id="searchIcon" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
					<span class="input-group-btn">
						<button class="btn btn-default" id="globalSearch" title="{*vtranslate('LBL_ADVANCE_SEARCH')*}" type="button">
							<span class="glyphicon glyphicon-th-large"></span>
						</button>
					</span>
				</div>
			</div>	
		</div>
		<div class="rightSide">
			<div class="pull-right rightHeaderBtn">
				<div class="dropdown quickAction historyBtn">
					<a data-placement="left" data-toggle="dropdown" class="btn btn-default btn-sm showHistoryBtn" aria-expanded="false" href="#">
						<img class='dropdown-toggle alignMiddle popoverTooltip' src="{*vimage_path('history.png')}" alt="{vtranslate('LBL_PAGES_HISTORY',$MODULE)*}" data-content="{*vtranslate('LBL_PAGES_HISTORY')*}" />
					</a>
				</div>
			</div>
			<div class="pull-right rightHeaderBtn">
				<div class="remindersNotice quickAction">
					<a class="btn btn-default btn-sm" title="{*vtranslate('LBL_CHAT',$MODULE)*}" href="#">
						<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
						<span class="badge hide">0</span>
					</a>
				</div>
			</div>
			<div class="pull-right rightHeaderBtn">
				<div class="headerLinksAJAXChat quickAction">
					<a class="btn btn-default btn-sm ChatIcon" title="{*vtranslate('LBL_CHAT',$MODULE)*}" href="#">
						<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
					</a>
				</div>
			</div>
			{if !empty($announcement)}
				<div class="pull-right rightHeaderBtn">
					<div class="quickAction">
						<a class="btn btn-default btn-sm" href="#">
							<img class='alignMiddle imgAnnouncement' src="{*vimage_path('btnAnnounceOff.png')*}" alt="{*vtranslate('LBL_ANNOUNCEMENT',$MODULE)*}" title="{*vtranslate('LBL_ANNOUNCEMENT',$MODULE)*}" id="announcementBtn" />
						</a>
					</div>
				</div>
			{/if}
			<div class="pull-right rightHeaderBtn">
				<div class="dropdown quickAction">
					<a id="menubar_quickCreate" class="dropdown-toggle btn btn-default btn-sm" data-toggle="dropdown" title="{*vtranslate('LBL_QUICK_CREATE',$MODULE)*}" href="#">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right commonActionsButtonDropDown">
						<li id="quickCreateModules">
							<div class="panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><strong>{*vtranslate('LBL_QUICK_CREATE',$MODULE)*}</strong></h4>
								</div>
								<div class="panel-body paddingLRZero">
									{*foreach key=NAME item=MODULEMODEL from=Vtiger_Module_Model::getQuickCreateModules(true)}
									{assign var='quickCreateModule' value=$MODULEMODEL->isQuickCreateSupported()}
									{assign var='singularLabel' value=$MODULEMODEL->getSingularLabelKey()}
									{if $singularLabel == 'SINGLE_Calendar'}
									{assign var='singularLabel' value='LBL_EVENT_OR_TASK'}
									{/if}	
									{if $quickCreateModule == '1'}
									{if $count % 3 == 0}
									<div class="">
									{/if}
									<div class="col-xs-4{if $count % 3 != 2} paddingRightZero{/if}">
									<a id="menubar_quickCreate_{$NAME}" class="quickCreateModule list-group-item" data-name="{$NAME}" data-url="{$MODULEMODEL->getQuickCreateUrl()}" href="javascript:void(0)" title="{vtranslate($singularLabel,$NAME)}">
									<span>{vtranslate($singularLabel,$NAME)}</span>
									</a>
									</div>
									{if $count % 3 == 2}
									</div>
									{/if}
									{assign var='count' value=$count+1}
									{/if}
									{/foreach*}
									{*if $count % 3 == 2}
									</div>
								{/if*}
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>	
    </div>
{/strip}
