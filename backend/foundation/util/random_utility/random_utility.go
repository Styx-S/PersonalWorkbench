package util

import (
	"PW/foundation/structure"
	"math/rand"
	"sort"
	"strconv"
	"strings"
	"time"
)

type RandomUtil struct {
	_rand *rand.Rand
}

var defaultUtil = RandomUtil{}

func DefaultRand() *rand.Rand {
	return defaultUtil.setupIfNeed()
}

func DefaultRandomUtil() *RandomUtil {
	return &defaultUtil
}

func (randomUtil *RandomUtil) setupIfNeed() *rand.Rand {
	if randomUtil._rand == nil {
		randomUtil._rand = rand.New(rand.NewSource(time.Now().UnixNano()))
	}
	return randomUtil._rand
}

// 在[l, r)区间中产生len个不重复的数
func (randomUtil *RandomUtil) RandomNoRepeatedNumberInRange(length int, left int, right int, need_sort bool) []int {
	var rand = randomUtil.setupIfNeed()
	var sec = right - left
	var resultSet = structure.SetFactory()

	for i := 0; i < length; i++ {

		t := rand.Intn(sec)
		for resultSet.Contains(t + left) {
			t = (t + 1) % sec
		}

		resultSet.Add(t + left)
	}

	var resultArr = make([]int, length)
	resultSet.VisitAll(func(i interface{}, idx int) {
		resultArr[idx] = i.(int)
	})

	if need_sort {
		sort.Ints(resultArr)
	}

	return resultArr
}

func (randomUtil *RandomUtil) RandomFixedLengthNumberStr(length int) string {
	strBuilder := strings.Builder{}

	strBuilder.WriteRune(rune('1' + randomUtil._rand.Intn(9)))

	for i := 1; i < length; i++ {
		strBuilder.WriteRune(rune('0' + randomUtil._rand.Intn(10)))
	}
	return strBuilder.String()
}

func (randomUtil *RandomUtil) GenUniqueID(length int) string {
	timeStr := strconv.FormatInt(time.Now().UnixNano(), 10)
	timeStrLen := len(timeStr)

	if timeStrLen >= length {
		return timeStr[timeStrLen-length : 0]
	}
	// 前后填充随机数
	bLen := (length - timeStrLen) / 2
	aLen := length - timeStrLen - bLen

	prefix := randomUtil.RandomFixedLengthNumberStr(aLen)
	suffix := randomUtil.RandomFixedLengthNumberStr(bLen)
	return prefix + timeStr + suffix
}
