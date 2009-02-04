<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/calendar-master.xsl"/>
<xsl:import href="../utilities/date-and-time.xsl"/>

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:param name="parent-root" select="concat($root,'/',$parent-path)"/>
<xsl:param name="current-root" select="concat($root,'/',$parent-path,'/',$current-page)"/>

<xsl:param name="url-year" select="$year"/>

<xsl:template match="data">  
  <xsl:param name="is-today">
    <xsl:choose>
      <xsl:when test="not($year) or $year='today' or $today = concat($year,'-',$month,'-',$day)">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="not-month">
    <xsl:choose>
      <xsl:when test="not($month)">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="not-day">
    <xsl:choose>
      <xsl:when test="not($day)">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="date">
    <xsl:choose>
      <xsl:when test="not($year) or $year='today'">
        <xsl:value-of select="$today"/>
      </xsl:when>
      <xsl:when test="$year and not($month)">
        <xsl:value-of select="concat($year,'-01-00')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $not-day = 1">
        <xsl:value-of select="concat($year,'-',$month,'-00')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day">
        <xsl:value-of select="concat(format-number($year,'0000'),'-',format-number($month,'00'),'-',format-number($day,'00'))"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="selected-date" select="concat(substring($date,1,4),'-',substring($date,6,2),'-',substring($date,9,2))"/>
    <xsl:param name="day">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,9,2)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="format-number($day,'00')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="month">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,6,2)"/>
        </xsl:when>
        <xsl:when test="not($month) and $year!='today'">
          <xsl:value-of select="'01'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="format-number($month,'00')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="year">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,1,4)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="format-number($year,'0000')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
  <xsl:param name="previous-year-url">
    <xsl:choose>
      <xsl:when test="$year and $not-month = 1">
        <xsl:value-of select="$year - 1"/>
      </xsl:when>
      <xsl:when test="$year and $month and $not-day = 1">
        <xsl:value-of select="concat($year - 1,'/',$month)"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day and $day = 0">
        <xsl:value-of select="concat($year - 1,'/',$month)"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day and $day > 0">
        <xsl:value-of select="concat($year - 1,'/',$month,'/',$day)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="next-year-url">
    <xsl:choose>
      <xsl:when test="$year and $not-month = 1">
        <xsl:value-of select="$year + 1"/>
      </xsl:when>
      <xsl:when test="$year and $month and $not-day = 1">
        <xsl:value-of select="concat($year + 1,'/',$month)"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day and $day = 0">
        <xsl:value-of select="concat($year + 1,'/',$month)"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day and $day > 0">
        <xsl:value-of select="concat($year + 1,'/',$month,'/',$day)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="current-date-url">
    <xsl:choose>
      <xsl:when test="$is-today = 1">
        <xsl:value-of select="concat($year,'/',$month,'/',$day,'/')"/>
      </xsl:when>
      <xsl:when test="$year and $not-month = 1">
        <xsl:value-of select="concat($year,'/')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $not-day = 1">
        <xsl:value-of select="concat($year,'/',$month,'/')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day = 0">
        <xsl:value-of select="concat($year,'/',$month,'/')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day &gt; 0">
        <xsl:value-of select="concat($year,'/',$month,'/',$day,'/')"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <div class="body">
    <xsl:choose>
      <xsl:when test="$year = 'NaN' or $year &lt; 1001 or $year &gt; 3000 or $month &gt; 12 or $month &lt; 1 or $day &gt; 31 or $day &lt; 1">
        <h2>Calendar</h2>
        <p>Please enter a date in the address fields in the form of /calendar/yyyy/mm/dd/ to view a calendar. Or you can find out what the date is <a href="{$root}/calendar/week/today/">today</a>. (This calendar does not calculate dates previous to 1,001 AD or greater than 3,000 AD.)</p>
      </xsl:when>
      <xsl:otherwise>
        <div class="calendar-head">
          <ul class="calendar-menu">
            <li><a href="{$current-root}/{$previous-year-url}/">Previous Year</a></li>
            <li><a href="{$current-root}/{$next-year-url}/">Next Year</a></li>
            <li>
              <xsl:if test="$is-today = 1">
                <xsl:attribute name="class">
                  <xsl:value-of select="'current'"/>
                </xsl:attribute>
              </xsl:if>
              <a href="{$current-root}/today/">Today</a>
            </li>
            <li><a href="{$parent-root}/day/{$current-date-url}">Day</a></li>
            <li><a href="{$parent-root}/week/{$current-date-url}">Week</a></li>
            <li><a href="{$parent-root}/{$current-date-url}">Month</a></li>
            <li class="current"><a href="{$current-root}/{$current-date-url}">Year</a></li>
          </ul>
          <h2><xsl:value-of select="$year"/> Calendar</h2>
        </div>
        <div class="calendar-year">
          <xsl:call-template name="calendar-year">
            <xsl:with-param name="year" select="substring($date,1,4)"/>
            <xsl:with-param name="selected-date" select="$selected-date"/>
          </xsl:call-template>
        </div>
      </xsl:otherwise>
    </xsl:choose>
    <hr/>
  </div>
</xsl:template>

<xsl:template name="calendar-year">
    <xsl:param name="year" select="$year"/>
    <xsl:param name="month-num" select="1"/>
    <xsl:param name="month" select="format-number($month-num,'00')"/>
    <xsl:param name="day" select="$day"/>
  <xsl:param name="selected-date" select="concat($year,'-',$month,'-',$day)"/>
  <div class="calendar-month">
    <xsl:choose>
      <xsl:when test="substring($today,6,2) = $month">
        <xsl:attribute name="class">calendar-month today</xsl:attribute>
      </xsl:when>
      <xsl:when test="substring($selected-date,6,2) = $month">
        <xsl:attribute name="class">calendar-month current</xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:attribute name="id">
      <xsl:value-of select="concat('month-',$month)"/>
    </xsl:attribute>
    <div class="calendar-head">
      <h3>
        <xsl:call-template name="get-formatted-month">
          <xsl:with-param name="month" select="$month"/>
        </xsl:call-template>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$year"/>
      </h3>
    </div>
    <xsl:call-template name="calendar-month">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="day" select="$day"/>
      <xsl:with-param name="weekday-format" select="'short'"/>
      <xsl:with-param name="selected-date" select="$selected-date"/>
    </xsl:call-template>
  </div>
  <xsl:if test="$month-num &lt; 12">
    <xsl:call-template name="calendar-year">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month-num" select="$month-num + 1"/>
      <xsl:with-param name="selected-date" select="$selected-date"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="calendar-month">
    <xsl:param name="year" select="$year"/>
    <xsl:param name="month" select="$month"/>
    <xsl:param name="day" select="$day"/>
  <xsl:param name="selected-date" select="concat($year,'-',$month,'-',$day)"/>
    <xsl:param name="weekday-format"/>
  <table summary="calendar">
    <thead>
      <tr>
        <xsl:choose>
          <xsl:when test="$weekday-format='one-letter'">
            <th>S</th>
            <th>M</th>
            <th>T</th>
            <th>W</th>
            <th>T</th>
            <th>F</th>
            <th>S</th>
          </xsl:when>
          <xsl:when test="$weekday-format='short'">
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
          </xsl:when>
          <xsl:otherwise>
            <th>Sunday</th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
            <th>Saturday</th>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
    </thead>
    <tbody>
      <xsl:call-template name="month">
        <xsl:with-param name="year" select="$year"/>
        <xsl:with-param name="month" select="$month"/>
        <xsl:with-param name="day" select="$day"/>
        <xsl:with-param name="selected-date" select="$selected-date"/>
      </xsl:call-template>
    </tbody>
  </table>
</xsl:template>

<!-- Called only once for root -->
<!-- Uses recursion with index + 7 for each week -->
<xsl:template name="month">
  <xsl:param name="year" select="'2007'"/>
  <xsl:param name="month" select="'07'"/>
  <xsl:param name="day" select="'24'"/>
  <xsl:param name="selected-date" select="concat($year,'-',$month,'-',$day)"/>
    <xsl:param name="date" select="concat($year,'-',$month,'-',$day)"/>
  <xsl:param name="first-day-of-the-month" select="concat($year,'-',$month,'-01')"/>
  <xsl:param name="leap-year">
    <xsl:call-template name="is-leap-year">
      <xsl:with-param name="year" select="$year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="first-day">
    <xsl:call-template name="calculate-day-of-the-week">
      <xsl:with-param name="date" select="$first-day-of-the-month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="total-days">
    <xsl:call-template name="total-days">
      <xsl:with-param name="leap-year" select="$leap-year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="start" select="$first-day"/>
  <xsl:param name="count" select="$total-days"/>
  <xsl:param name="total" select="$start + $count - 1"/>
  <xsl:param name="overflow" select="$total mod 7"/>
  <xsl:param name="nelements">
    <xsl:choose>
      <xsl:when test="$overflow &gt; 0"><xsl:value-of select="$total + 7 - $overflow"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$total"/></xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="index" select="1"/>

  <xsl:if test="$index &lt; $nelements">
    <xsl:call-template name="week">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="day" select="$day"/>
      <xsl:with-param name="index" select="$index"/>
      <xsl:with-param name="selected-date" select="$selected-date"/>
    </xsl:call-template>
    <xsl:call-template name="month">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="day" select="$day"/>
      <xsl:with-param name="index" select="$index + 7"/>
      <xsl:with-param name="selected-date" select="$selected-date"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- Called repeatedly by month for each week -->
<xsl:template name="week">
  <xsl:param name="year" select="'2007'"/>
  <xsl:param name="month" select="'07'"/>
  <xsl:param name="day" select="'24'"/>
  <xsl:param name="selected-date" select="concat($year,'-',$month,'-',$day)"/>
    <xsl:param name="index" select="1"/>
    <tr>
        <xsl:call-template name="days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="day" select="$day"/>
            <xsl:with-param name="index" select="$index"/>
            <xsl:with-param name="counter" select="$index + 6"/>
      <xsl:with-param name="selected-date" select="$selected-date"/>
        </xsl:call-template>
    </tr>
</xsl:template>

<!-- Called by week -->
<!-- Uses recursion with index + 1 for each day-of-week -->
<xsl:template name="days">
  <xsl:param name="year" select="'2007'"/>
  <xsl:param name="month" select="'07'"/>
  <xsl:param name="day" select="'24'"/>
  <xsl:param name="selected-date" select="concat($year,'-',$month,'-',$day)"/>
  <xsl:param name="month-int">
    <xsl:choose>
      <xsl:when test="substring($month, 1, 1) = 0"><xsl:value-of select="substring($month, 2, 1)"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$month"/></xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="first-day-of-the-month" select="concat($year,'-',$month,'-01')"/>
  <xsl:param name="leap-year">
    <xsl:call-template name="is-leap-year">
      <xsl:with-param name="year" select="$year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="first-day">
    <xsl:call-template name="calculate-day-of-the-week">
      <xsl:with-param name="date" select="$first-day-of-the-month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="total-days">
    <xsl:call-template name="total-days">
      <xsl:with-param name="leap-year" select="$leap-year"/>
      <xsl:with-param name="month-int" select="$month-int"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="start" select="$first-day"/>
  <xsl:param name="count" select="$total-days"/>
  <xsl:param name="total" select="$start + $count - 1"/>
  <xsl:param name="overflow" select="$total mod 7"/>
  <xsl:param name="nelements">
    <xsl:choose>
      <xsl:when test="$overflow &gt; 0"><xsl:value-of select="$total + 7 - $overflow"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$total"/></xsl:otherwise>
    </xsl:choose>
  </xsl:param>

    <xsl:param name="index" select="1"/>
    <xsl:param name="counter" select="1"/>
    <xsl:param name="day-int" select="$index - $start + 1"/>
    <xsl:param name="day-dd" select="format-number($day-int,'00')"/>

    <xsl:param name="this-date">
    <xsl:value-of select="concat($year,'-',$month,'-',$day-dd)"/>
    </xsl:param>
    <xsl:param name="this-month-day" select="substring(translate($this-date, '-', ''),5)"/>
  <xsl:param name="is-today">
    <xsl:if test="$this-date = $today">1</xsl:if>
  </xsl:param>
  <xsl:param name="is-selected">
    <xsl:if test="$day-int = $day and substring($selected-date,6,2) = $month">1</xsl:if>
  </xsl:param>
  <xsl:param name="is-holiday">
    <xsl:for-each select="iCalendar/vcalendar[@x-wr-calname='Holidays']/vevent[substring(dtstart,5) = $this-month-day][not(rrule/item/@class='byday') and rrule/item[@class='freq']='yearly']">
      <xsl:if test="substring(dtstart,5) = $this-month-day">1</xsl:if>
    </xsl:for-each>
  </xsl:param>
    <xsl:choose>
        <xsl:when test="$index &lt; $start">
            <td></td>
        </xsl:when>
        <xsl:when test="$day-int &gt; $count">
            <td></td>
        </xsl:when>
        <xsl:when test="$index &gt; $start - 1">
            <td>
        <xsl:choose>
          <xsl:when test="$is-holiday = 1 and $day-int = $day and substring($selected-date,6,2) = $month">
            <xsl:attribute name="class">current holiday</xsl:attribute>
          </xsl:when>
          <xsl:when test="$is-today = 1 and $url-year = 'today'">
            <xsl:attribute name="class">current</xsl:attribute>
          </xsl:when>
          <xsl:when test="$day-int = $day and substring($selected-date,6,2) = $month">
            <xsl:attribute name="class">current</xsl:attribute>
          </xsl:when>
          <xsl:when test="$is-holiday = 1">
            <xsl:attribute name="class">holiday</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <xsl:if test="$is-today = 1">
          <xsl:attribute name="id">today</xsl:attribute>
        </xsl:if>
          <span>
            <a href="{$current-root}/{$year}/{$month}/{$day-dd}/">
              <xsl:choose>
                <xsl:when test="$is-today = 1 and $is-holiday != 1 and $is-selected != 1">
                  <xsl:attribute name="title">Today</xsl:attribute>
                </xsl:when>
                <xsl:when test="$is-today = 1 and $is-holiday = 1 and $is-selected != 1">
                  <xsl:attribute name="title">Today is <xsl:value-of select="iCalendar/vcalendar[@x-wr-calname='Holidays']/vevent[substring(dtstart,5) = $this-month-day]/summary"/></xsl:attribute>
                </xsl:when>
                <xsl:when test="$is-today = 1 and $is-holiday != 1 and $is-selected = 1">
                  <xsl:attribute name="title">The selected day is today</xsl:attribute>
                </xsl:when>
                <xsl:when test="$is-today != 1 and $is-holiday != 1 and $is-selected = 1">
                  <xsl:attribute name="title">Selected Day</xsl:attribute>
                </xsl:when>
                <xsl:when test="$is-today != 1 and $is-holiday = 1 and $is-selected = 1">
                  <xsl:attribute name="title">The selected day is <xsl:value-of select="iCalendar/vcalendar[@x-wr-calname='Holidays']/vevent[substring(dtstart,5) = $this-month-day]/summary"/></xsl:attribute>
                </xsl:when>
                <xsl:when test="$is-today != 1 and $is-holiday = 1 and $is-selected != 1">
                  <xsl:attribute name="title"><xsl:value-of select="iCalendar/vcalendar[@x-wr-calname='Holidays']/vevent[substring(dtstart,5) = $this-month-day]/summary"/></xsl:attribute>
                </xsl:when>
              </xsl:choose>
              <xsl:value-of select="$day-int"/>
            </a>
          </span>
        </td>
      </xsl:when>
    </xsl:choose>
    <xsl:if test="$counter &gt; $index">
        <xsl:call-template name="days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="day" select="$day"/>
            <xsl:with-param name="index" select="$index + 1"/>
            <xsl:with-param name="counter" select="$counter"/>
      <xsl:with-param name="selected-date" select="$selected-date"/>
        </xsl:call-template>
    </xsl:if>

</xsl:template>

<xsl:template name="total-days">
  <xsl:param name="leap-year"/>
  <xsl:param name="month-int" select="1"/>
  <xsl:choose>
    <xsl:when test="$month-int!='2'">
      <xsl:value-of select="/data/calendar/year/month[@value=$month-int]/@days"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$leap-year=1">
          <xsl:value-of select="/data/calendar/year/month[@value=2]/@leap-year-days"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="/data/calendar/year/month[@value=2]/@days"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
  
</xsl:stylesheet>