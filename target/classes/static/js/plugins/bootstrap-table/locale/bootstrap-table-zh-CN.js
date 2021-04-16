/**
 * Bootstrap Table Chinese translation
 * Author: Zhixin Wen<wenzhixin2010@gmail.com>
 */
(function ($) {
    'use strict';

    $.fn.bootstrapTable.locales['EN'] = {
        formatLoadingMessage: function () {
            return 'Trying to load data, please wait……';
        },
        formatRecordsPerPage: function (pageNumber) {
            return 'Every page shows ' + pageNumber + ' records';
        },
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return 'Show page from' + pageFrom + ' to ' + pageTo + ' records, ' + totalRows + ' records in total';
        },
        formatSearch: function () {
            return 'Search';
        },
        formatNoMatches: function () {
            return 'No matching records found';
        },
        formatPaginationSwitch: function () {
            return 'Hide/show tab';
        },
        formatRefresh: function () {
            return 'Refresh';
        },
        formatToggle: function () {
            return 'Switch';
        },
        formatColumns: function () {
            return 'Row';
        }
    };

    $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);

})(jQuery);
