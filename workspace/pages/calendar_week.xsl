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
        <xsl:value-of select="concat($year,'-01-01')"/>
      </xsl:when>
      <xsl:when test="$year and $month and not($day)">
        <xsl:value-of select="concat($year,'-',$month,'-01')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day">
        <xsl:value-of select="concat(format-number($year,'0000'),'-',format-number($month,'00'),'-',format-number($day,'00'))"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
    <xsl:param name="day">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,9,2)"/>
        </xsl:when>
        <xsl:when test="$month and not($day)">
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
  <xsl:param name="month-days">
    <xsl:call-template name="month-days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="next-month-days">
    <xsl:call-template name="next-month-days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="previous-month-days">
    <xsl:call-template name="previous-month-days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="previous-week">
    <xsl:call-template name="previous-week">
      <xsl:with-param name="date" select="$date"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="next-week">
    <xsl:call-template name="next-week">
      <xsl:with-param name="date" select="$date"/>
    </xsl:call-template>
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
  <xsl:param name="previous-week-url">
    <xsl:value-of select="concat(substring($previous-week,1,4),'/',substring($previous-week,6,2),'/',substring($previous-week,9,2))"/>
  </xsl:param>
  <xsl:param name="next-week-url">
    <xsl:value-of select="concat(substring($next-week,1,4),'/',substring($next-week,6,2),'/',substring($next-week,9,2))"/>
  </xsl:param>
  <xsl:param name="previous-year-url">
    <xsl:choose>
      <xsl:when test="$is-today = 1">
        <xsl:value-of select="concat($year - 1,'/',$month,'/',substring($date,9,2))"/>
      </xsl:when>
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
      <xsl:when test="$is-today = 1">
        <xsl:value-of select="concat($year + 1,'/',$month,'/',substring($date,9,2))"/>
      </xsl:when>
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
  <xsl:param name="previous-month-url">
    <xsl:choose>
      <xsl:when test="$month - 1 &lt; 1">
        <xsl:choose>
          <xsl:when test="$is-today = 1">
            <xsl:value-of select="concat($year - 1,'/12/',substring($date,9,2))"/>
          </xsl:when>
          <xsl:when test="($year and $not-month = 1) or ($year and $month and $not-day = 1)">
            <xsl:value-of select="concat($year - 1,'/12')"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day">
            <xsl:value-of select="concat($year - 1,'/12/',$day)"/>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$is-today = 1">
            <xsl:value-of select="concat($year,'/',format-number($month - 1,'00'),'/',substring($date,9,2))"/>
          </xsl:when>
          <xsl:when test="$year and $not-month = 1">
            <xsl:value-of select="concat($year,'/',format-number($month - 1,'00'))"/>
          </xsl:when>
          <xsl:when test="$year and $month and $not-day = 1">
            <xsl:value-of select="concat($year,'/',format-number($month - 1,'00'))"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day = 0">
            <xsl:value-of select="concat($year,'/',format-number($month - 1,'00'))"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day &gt; 0 and $day &lt;= $previous-month-days">
            <xsl:value-of select="concat($year,'/',format-number($month - 1,'00'),'/',$day)"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day &gt; $previous-month-days">
            <xsl:value-of select="concat($year,'/',format-number($month - 1,'00'),'/',$previous-month-days)"/>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="next-month-url">
    <xsl:choose>
      <xsl:when test="$month + 1 &gt; 12">
        <xsl:choose>
          <xsl:when test="$is-today = 1">
            <xsl:value-of select="concat($year + 1,'/01/',substring($date,9,2))"/>
          </xsl:when>
          <xsl:when test="($year and $not-month = 1) or ($year and $month and $not-day = 1)">
            <xsl:value-of select="concat($year + 1,'/01')"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day">
            <xsl:value-of select="concat($year + 1,'/01/',$day)"/>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$is-today = 1">
            <xsl:value-of select="concat($year,'/',format-number($month + 1,'00'),'/',substring($date,9,2))"/>
          </xsl:when>
          <xsl:when test="$year and $not-month = 1">
            <xsl:value-of select="concat($year,'/',format-number($month + 1,'00'))"/>
          </xsl:when>
          <xsl:when test="$year and $month and $not-day = 1">
            <xsl:value-of select="concat($year,'/',format-number($month + 1,'00'))"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day = 0">
            <xsl:value-of select="concat($year,'/',format-number($month + 1,'00'))"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day &gt; 0 and $day &lt;= $next-month-days">
            <xsl:value-of select="concat($year,'/',format-number($month + 1,'00'),'/',$day)"/>
          </xsl:when>
          <xsl:when test="$year and $month and $day &gt; $next-month-days">
            <xsl:value-of select="concat($year,'/',format-number($month + 1,'00'),'/',$next-month-days)"/>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="previous-month-date">
    <xsl:choose>
      <xsl:when test="$month - 1 &lt; 1">
        <xsl:value-of select="concat($year - 1,'-12-00')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($year,'-',format-number($month - 1,'00'),'-00')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="next-month-date">
    <xsl:choose>
      <xsl:when test="$month + 1 &gt; 12">
        <xsl:value-of select="concat($year + 1,'-01-00')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($year,'-',format-number($month + 1,'00'),'-00')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <div class="body">
    <xsl:choose>
      <xsl:when test="$year = 'NaN' or $year &lt; 1001 or $year &gt; 3000 or $month &gt; 12 or $month &lt; 1 or $day &gt; 31 or $day &lt; 1">
        <h2>Calendar</h2>
        <p>Please enter a date in the address fields in the form of /calendar/yyyy/mm/dd/ to view a calendar. Or you can find out what the date is <a href="{$current-root}/today/">today</a>. (This calendar does not calculate dates previous to 1,001 AD or greater than 3,000 AD.)</p>
      </xsl:when>
      <xsl:otherwise>
        <div class="calendar calendar-week">
          <div class="calendar-head">
            <ul class="calendar-menu">
              <li><a href="{$current-root}/{$previous-week-url}/">Previous Week</a></li>
              <li><a href="{$current-root}/{$next-week-url}/">Next Week</a></li>
              <li><a href="{$current-root}/{$previous-month-url}/">Previous Month</a></li>
              <li><a href="{$current-root}/{$next-month-url}/">Next Month</a></li>
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
              <li class="current"><a href="{$current-root}/{$current-date-url}">Week</a></li>
              <li><a href="{$parent-root}/{$current-date-url}">Month</a></li>
              <li><a href="{$parent-root}/year/{$current-date-url}">Year</a></li>
            </ul>
            <h2>
              <xsl:call-template name="get-formatted-month">
                <xsl:with-param name="month" select="$month"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$year"/>
            </h2>
          </div>
          <xsl:call-template name="calendar-week">
            <xsl:with-param name="year" select="substring($date,1,4)"/>
            <xsl:with-param name="month" select="substring($date,6,2)"/>
            <xsl:with-param name="day" select="substring($date,9,2)"/>
          </xsl:call-template>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<xsl:template name="calendar-week">
    <xsl:param name="year" select="$year"/>
    <xsl:param name="month" select="$month"/>
    <xsl:param name="day" select="$day"/>
    <xsl:param name="weekday-format"/>
  <table summary="calendar">
    <thead>
      <tr>
        <th></th>
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
      <xsl:call-template name="this-week">
        <xsl:with-param name="year" select="$year"/>
        <xsl:with-param name="month" select="$month"/>
        <xsl:with-param name="day" select="$day"/>
      </xsl:call-template>
      <xsl:call-template name="calendar-week-hours"/>
    </tbody>
  </table>
</xsl:template>

<!-- Called only once for root -->
<!-- Uses recursion with index + 7 for each week -->
<xsl:template name="this-week">
  <xsl:param name="year" select="'2007'"/>
  <xsl:param name="month" select="'07'"/>
  <xsl:param name="day" select="'24'"/>
    <xsl:param name="date" select="concat($year,'-',$month,'-',$day)"/>
  <xsl:param name="first-day-of-the-month" select="concat($year,'-',$month,'-01')"/>
  <xsl:param name="day-of-the-week">
    <xsl:call-template name="calculate-day-of-the-week">
      <xsl:with-param name="date" select="$date"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="week-number">
    <xsl:call-template name="week-number">
      <xsl:with-param name="date" select="$date"/>
    </xsl:call-template>
  </xsl:param>
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
  <xsl:param name="month-days">
    <xsl:call-template name="month-days">
      <xsl:with-param name="leap-year" select="$leap-year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="start" select="$first-day"/>
  <xsl:param name="count" select="$month-days"/>
  <xsl:param name="total" select="$start + $count - 1"/>
  <xsl:param name="overflow" select="$total mod 7"/>
  <xsl:param name="nelements">
    <xsl:choose>
      <xsl:when test="$overflow &gt; 0"><xsl:value-of select="$total + 7 - $overflow"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$total"/></xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="index" select="$start + $day - $day-of-the-week"/>
  <xsl:call-template name="week">
    <xsl:with-param name="year" select="$year"/>
    <xsl:with-param name="month" select="$month"/>
    <xsl:with-param name="day" select="$day"/>
    <xsl:with-param name="index" select="$index"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="week">
  <xsl:param name="year" select="'2007'"/>
  <xsl:param name="month" select="'07'"/>
  <xsl:param name="day" select="'24'"/>
    <xsl:param name="index" select="1"/>
    <tr>
        <td class="hour"></td>
        <xsl:call-template name="days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="day" select="$day"/>
            <xsl:with-param name="index" select="$index"/>
            <xsl:with-param name="counter" select="$index + 6"/>
        </xsl:call-template>
    </tr>
</xsl:template>

<!-- Called by week -->
<!-- Uses recursion with index + 1 for each day-of-week -->
<xsl:template name="days">
  <xsl:param name="year" select="'2007'"/>
  <xsl:param name="month" select="'07'"/>
  <xsl:param name="day" select="'24'"/>
  <xsl:param name="month-int" select="format-number($month,'0')"/>
  <xsl:param name="first-day-of-the-month" select="concat($year,'-',$month,'-01')"/>

  <xsl:param name="selected-date" select="concat($year,'-',$month,'-',$day)"/>
  <xsl:param name="selected-day-of-the-week">
    <xsl:call-template name="calculate-day-of-the-week">
      <xsl:with-param name="date" select="$selected-date"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="selected-week-number">
    <xsl:call-template name="week-number">
      <xsl:with-param name="date" select="$selected-date"/>
    </xsl:call-template>
  </xsl:param>

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
  <xsl:param name="first-day-of-the-week">
  </xsl:param>
  <xsl:param name="month-days">
    <xsl:call-template name="month-days">
      <xsl:with-param name="leap-year" select="$leap-year"/>
      <xsl:with-param name="month-int" select="$month-int"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="start" select="$first-day"/>
  <xsl:param name="count" select="$month-days"/>
  <xsl:param name="total" select="$start + $count - 1"/>
  <xsl:param name="overflow" select="$total mod 7"/>
  <xsl:param name="nelements">
    <xsl:choose>
      <xsl:when test="$overflow &gt; 0"><xsl:value-of select="$total + 7 - $overflow"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$total"/></xsl:otherwise>
    </xsl:choose>
  </xsl:param>


  <xsl:param name="previous-month">
    <xsl:call-template name="previous-month">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="previous-month-year">
    <xsl:call-template name="previous-month-year">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="next-month">
    <xsl:call-template name="next-month">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="next-month-year">
    <xsl:call-template name="next-month-year">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="previous-month-days">
    <xsl:call-template name="previous-month-days">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>

    <xsl:param name="index" select="1"/>
    <xsl:param name="counter" select="1"/>
    <xsl:param name="day-int" select="$index - $start + 1"/>
    <xsl:param name="day-dd" select="format-number($day-int,'00')"/>
    <xsl:param name="previous-day" select="$previous-month-days + $day-int"/>
    <xsl:param name="next-day" select="format-number($day-int - $month-days,'00')"/>
    <xsl:param name="this-date">
      <xsl:choose>
        <xsl:when test="$day-int &gt; 0 and $day-int &lt;= $month-days">
          <xsl:value-of select="concat($year,'-',$month,'-',$day-dd)"/>
        </xsl:when>
        <xsl:when test="$day-int &lt; 1">
          <xsl:value-of select="concat($previous-month-year,'-',$previous-month,'-',$previous-day)"/>
        </xsl:when>
        <xsl:when test="$day-int &gt; $month-days">
          <xsl:value-of select="concat($next-month-year,'-',$next-month,'-',$next-day)"/>
        </xsl:when>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="this-year" select="substring($this-date,1,4)"/>
    <xsl:param name="this-month" select="substring($this-date,6,2)"/>
    <xsl:param name="this-day" select="substring($this-date,9,2)"/>
    <xsl:param name="this-day-int" select="format-number($this-day,'0')"/>
    <xsl:param name="this-month-day" select="substring(translate($this-date, '-', ''),5)"/>
  <xsl:param name="is-today">
    <xsl:choose>
      <xsl:when test="$this-date = $today">1</xsl:when>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="is-holiday">
    <xsl:for-each select="iCalendar/vcalendar[@x-wr-calname='Holidays']/vevent[substring(dtstart,5) = $this-month-day][not(rrule/item/@class='byday') and rrule/item[@class='freq']='yearly']">
      <xsl:if test="substring(dtstart,5) = $this-month-day">1</xsl:if>
    </xsl:for-each>
  </xsl:param>
    <xsl:choose>
        <xsl:when test="$index &lt; $start">
            <td class="previous-month-day">
              <span><a href="{$current-root}/{$this-year}/{$this-month}/{$this-day}/"><xsl:value-of select="$this-day-int"/></a></span>
            </td>
        </xsl:when>
        <xsl:when test="$day-int &gt; $count">
            <td class="next-month-day">
              <span><a href="{$current-root}/{$this-year}/{$this-month}/{$this-day}/"><xsl:value-of select="$this-day-int"/></a></span>
            </td>
        </xsl:when>
        <xsl:when test="$index &gt; $start - 1">
            <td>
        <xsl:if test="$day-int = $day">
          <xsl:attribute name="class">current</xsl:attribute>
        </xsl:if>
        <xsl:if test="$is-today = 1">
          <xsl:attribute name="id">today</xsl:attribute>
        </xsl:if>
              <span><a href="{$current-root}/{$year}/{$month}/{$day-dd}/"><xsl:value-of select="$day-int"/></a></span>
              <xsl:if test="$is-holiday = 1">
                <p class="holiday"><xsl:value-of select="iCalendar/vcalendar[@x-wr-calname='Holidays']/vevent[substring(dtstart,5) = $this-month-day]/summary"/></p>
              </xsl:if>
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
        </xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="calendar-week-hours">
    <xsl:param name="minutes" select="'00'"/>
    <xsl:param name="am-pm" select="'AM'"/>
  <xsl:param name="count" select="0"/>
    <xsl:param name="hour">
      <xsl:choose>
        <xsl:when test="$count = 0">12</xsl:when>
        <xsl:otherwise><xsl:value-of select="$count"/></xsl:otherwise>
      </xsl:choose>
    </xsl:param>
  <tr class="hour-row">
    <td class="hour"><xsl:value-of select="concat($hour,':',$minutes,' ',$am-pm)"/></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
    <xsl:if test="$count &lt; 11 and $am-pm = 'AM'">
        <xsl:call-template name="calendar-week-hours">
      <xsl:with-param name="minutes" select="$minutes"/>
      <xsl:with-param name="am-pm" select="$am-pm"/>
            <xsl:with-param name="count" select="$count + 1"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$count = 11 and $am-pm = 'AM'">
        <xsl:call-template name="calendar-week-hours">
      <xsl:with-param name="minutes" select="$minutes"/>
      <xsl:with-param name="am-pm" select="'PM'"/>
            <xsl:with-param name="count" select="0"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$count &lt; 11 and $am-pm = 'PM'">
        <xsl:call-template name="calendar-week-hours">
      <xsl:with-param name="minutes" select="$minutes"/>
      <xsl:with-param name="am-pm" select="$am-pm"/>
            <xsl:with-param name="count" select="$count + 1"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="month-days">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:param name="month-int" select="format-number($month,'0')"/>
  <xsl:param name="leap-year">
    <xsl:call-template name="is-leap-year">
      <xsl:with-param name="year" select="$year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:choose>
    <xsl:when test="$month-int!=2">
      <xsl:value-of select="/data/calendar/year/month[@value=$month-int]/@days"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$leap-year!=1">
          <xsl:value-of select="/data/calendar/year/month[@value=2]/@days"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="/data/calendar/year/month[@value=2]/@leap-year-days"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="previous-month">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:choose>
    <xsl:when test="$month - 1 &lt; 1">12</xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="format-number($month - 1,'00')"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="next-month">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:choose>
    <xsl:when test="$month + 1 &gt; 12">01</xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="format-number($month + 1,'00')"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="previous-month-year">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:choose>
    <xsl:when test="$month != 1">
      <xsl:value-of select="$year"/>
    </xsl:when>
    <xsl:when test="$month = 1">
      <xsl:value-of select="$year - 1"/>
    </xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="next-month-year">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:choose>
    <xsl:when test="$month &lt; 12">
      <xsl:value-of select="$year"/>
    </xsl:when>
    <xsl:when test="$month = 12">
      <xsl:value-of select="$year + 1"/>
    </xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="previous-week">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:param name="day" select="substring($date,9,2)"/>
  <xsl:param name="previous-month">
    <xsl:call-template name="previous-month">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="previous-month-year">
    <xsl:call-template name="previous-month-year">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="previous-month-days">
    <xsl:call-template name="month-days">
      <xsl:with-param name="year" select="$previous-month-year"/>
      <xsl:with-param name="month" select="$previous-month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:choose>
    <xsl:when test="$day - 7 &lt; 1 and $month = 1">
      <xsl:value-of select="concat($previous-month-year,'-',$previous-month,'-',format-number($previous-month-days - (7 - $day),'00'))"/>
    </xsl:when>
    <xsl:when test="$day - 7 &lt; 1 and $month &gt; 1">
      <xsl:value-of select="concat($year,'-',$previous-month,'-',format-number($previous-month-days - (7 - $day),'00'))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat($year,'-',$month,'-',format-number($day - 7,'00'))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="next-week">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:param name="day" select="substring($date,9,2)"/>
  <xsl:param name="month-days">
    <xsl:call-template name="month-days">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="next-month">
    <xsl:call-template name="next-month">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="next-month-year">
    <xsl:call-template name="next-month-year">
      <xsl:with-param name="year" select="$year"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:choose>
    <xsl:when test="$day + 7 &gt; $month-days">
      <xsl:value-of select="concat($next-month-year,'-',$next-month,'-',format-number($day + 7 - $month-days,'00'))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat($year,'-',$month,'-',format-number($day + 7,'00'))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="previous-month-days">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:param name="previous-month">
    <xsl:call-template name="previous-month">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="leap-year">
    <xsl:call-template name="is-leap-year">
      <xsl:with-param name="year" select="$year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:call-template name="month-days">
    <xsl:with-param name="leap-year" select="$leap-year"/>
    <xsl:with-param name="month" select="$previous-month"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="next-month-days">
  <xsl:param name="date"/>
  <xsl:param name="year" select="substring($date,1,4)"/>
  <xsl:param name="month" select="substring($date,6,2)"/>
  <xsl:param name="next-month">
    <xsl:call-template name="next-month">
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="leap-year">
    <xsl:call-template name="is-leap-year">
      <xsl:with-param name="year" select="$year"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:call-template name="month-days">
    <xsl:with-param name="leap-year" select="$leap-year"/>
    <xsl:with-param name="month" select="$next-month"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="week-number">
  <xsl:param name="date" select="$today"/>
  <xsl:param name="year" select="substring($date, 1, 4)" />
  <xsl:param name="leap" select="(not($year mod 4) and $year mod 100) or not($year mod 400)" />
  <xsl:param name="month" select="substring($date, 6, 2)" />
  <xsl:param name="day" select="substring($date, 9, 2)" />
  <xsl:param name="month-days">
    <xsl:call-template name="month-days">
      <xsl:with-param name="leap-year" select="$leap"/>
      <xsl:with-param name="month" select="$month"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="days">
     <xsl:choose>
      <xsl:when test="$leap and $month > 2">
       <xsl:value-of select="$month-days + $day + 1" />
      </xsl:when>
      <xsl:otherwise>
       <xsl:value-of select="$month-days + $day" />
      </xsl:otherwise>
     </xsl:choose>
  </xsl:param>
  <xsl:param name="y-1" select="$year - 1" />
  <xsl:param name="day-of-week" 
          select="(($y-1 + floor($y-1 div 4) -
               floor($y-1 div 100) + floor($y-1 div 400) +
               $days) 
               mod 7) + 1" />
  <xsl:choose>
     <xsl:when test="($day - $day-of-week) mod 7">
      <xsl:value-of select="floor(($day - $day-of-week) div 7) + 2" />
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="floor(($day - $day-of-week) div 7) + 1" />
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>
  
</xsl:stylesheet>