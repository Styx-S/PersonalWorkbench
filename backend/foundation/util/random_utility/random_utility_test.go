package util

import (
	"testing"
)

func TestRandomUtil_RandomNoRepeatedNumberInRange(t *testing.T) {
	type args struct {
		length int
		left   int
		right  int
	}
	tests := []struct {
		name       string
		randomUtil *RandomUtil
		args       args
	}{
		{
			name:       "密码生成场景",
			randomUtil: DefaultRandomUtil(),
			args:       args{4, 0, 32},
		},
		{
			name:       "其他场景",
			randomUtil: DefaultRandomUtil(),
			args:       args{100, 100, 1000},
		},
		{
			name:       "异常场景",
			randomUtil: DefaultRandomUtil(),
			args:       args{499, 500, 1000},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {

			got := tt.randomUtil.RandomNoRepeatedNumberInRange(tt.args.length, tt.args.left, tt.args.right, true)

			error := false
			for {

				if len(got) != tt.args.length {
					error = true
					break
				}

				for i, e := range got {
					// 判断范围
					if e < tt.args.left || e >= tt.args.right {
						error = true
						break
					}

					// 不重复
					containsOther := false
					for j := i + 1; j < len(got); j++ {
						if got[j] == e {
							containsOther = true
							break
						}
					}
					if containsOther {
						error = true
						break
					}
				}

				if true {
					break
				}

			}

			if error {
				t.Errorf("RandomUtil.RandomNoRepeatedNumberInRange() = %v, random error", got)
			}

		})
	}
}
