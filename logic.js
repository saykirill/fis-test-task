/* =============================================
    Тестовое задание
============================================= */

/**
* Задача найти studId, имеющий наибольшее количество просроченных дней. Вероятно, данные подаются в функцию многомерным массивом,
* либо в каком-нибудь формате, который можно к нему свести. Мы же используем 3 массива.
* @param  {string} startDate Входной столбец. Дата выдачи книги. Формат даты ГГГГ-ММ-ДД.
* @param  {string} endDate Входной столбец. Дата возврата книги. Формат даты ГГГГ-ММ-ДД.
* @param  {number} studId столбец studId
* @return {number} id соотв. максимальному количеству дней
*/

function getId(studId, startDate, endDate) {
  const maxTerm = 14; //дней
  let sum = [];
  for (let i = 0; i < startDate.length; i++) {
    sum[studId[i]] = 0;
  }
  for (let i = 0; i < startDate.length; i++) {
    if (!isNaN(endDate[i]) || endDate[i] !== undefined) {
      //если книга до сих пор не сдана, то для подсчёта мы берём текущую дату в else
      let dateDif = dateDifference(startDate[i], endDate[i]);
      if (dateDif > maxTerm) {
        sum[studId[i]] += +dateDif;
      }
    } else {
      endDate [i] = new Date();
      dateDif = dateDifference(startDate[i], endDate[i].toISOString());
      sum[studId[i]] += +dateDif;
    }
  }
  badId = getMaxSumId(sum);
  return badId;
}

function dateDifference(str1, str2) {
  const msInDays = 1/(1000*60*60*24);
  let date1 = new Date(str1.substr(0, 4), str1.substr(5, 2), str1.substr(8, 2));
  let date2 = new Date(str2.substr(0, 4), str2.substr(5, 2), str2.substr(8, 2));
  return (date2-date1)*msInDays; //в днях
}

function getMaxSumId(arr) {
  let maxSum = 0,
  studId = -1;
  for (let i = 0; i < arr.length; i++) {
    if (maxSum <= arr[i]) {
      maxSum = arr[i];
      studId = i;
    }
  }
  return studId;
}

/* ============================================= */
